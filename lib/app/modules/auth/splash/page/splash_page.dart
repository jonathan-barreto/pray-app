import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/core/consts/app_assets.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/auth/splash/controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<SplashController>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // return;

      await Future.delayed(const Duration(seconds: 3));

      if (!mounted) return;

      await _controller.loadToken();

      if (!mounted) {
        return;
      }

      if (AppController.instance.token != null) {
        await _controller.loadProfile();

        if (!mounted) {
          return;
        }

        if (_controller.hasProfileError) {
          GoRouter.of(context).goNamed(AppRoutes.loginName);
        } else {
          GoRouter.of(context).goNamed(AppRoutes.homeName);
        }
      } else {
        GoRouter.of(context).goNamed(AppRoutes.welcomeName);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListenableBuilder(
        listenable: AppController.instance,
        builder: (context, _) {
          return Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  AppAssets.backgroundFull,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballPulse,
                    colors: [AppColors.white],
                    strokeWidth: 2,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
