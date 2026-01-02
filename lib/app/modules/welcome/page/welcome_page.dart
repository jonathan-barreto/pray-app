import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/modules/welcome/widgets/welcome_description.dart';
import 'package:pray_app/app/modules/welcome/widgets/welcome_headline.dart';
import 'package:pray_app/app/modules/welcome/widgets/welcome_illustration.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              const Expanded(child: WelcomeIllustration()),
              const SizedBox(height: 48),
              const WelcomeHeadline(),
              const SizedBox(height: 16),
              const WelcomeDescription(),
              const SizedBox(height: 24),
              AppButton(
                label: 'Começar',
                onPressed: () =>
                    GoRouter.of(context).goNamed(AppRoutes.loginName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
