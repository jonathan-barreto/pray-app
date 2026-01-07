import 'package:flutter/material.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/theme/app_theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pray_app/app/di/di.dart' as di;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await di.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pray',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: appRouter,
    );
  }
}
