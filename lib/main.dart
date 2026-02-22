import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/theme/app_theme.dart';
import 'package:pray_app/app/di/di.dart' as di;
import 'package:pray_app/l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await di.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AppController.instance.addListener(_onLocaleChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final deviceLocale = View.of(context).platformDispatcher.locale;
      AppController.instance.setDefaultLocaleFromDevice(deviceLocale);
    });
  }

  void _onLocaleChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    AppController.instance.removeListener(_onLocaleChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Locale? appLocale = AppController.instance.locale;

    return MaterialApp.router(
      locale: appLocale,
      title: 'Pray',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: appRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt'),
        Locale('en'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (appLocale != null) {
          return appLocale;
        }

        return supportedLocales.firstWhere(
          (supportedLocale) =>
              supportedLocale.languageCode == locale?.languageCode,
          orElse: () => supportedLocales.first,
        );
      },
    );
  }
}
