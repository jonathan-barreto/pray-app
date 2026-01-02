import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/core/widgets/email_text_field.dart';
import 'package:pray_app/app/core/widgets/password_text_field.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/auth/login/controller/login_page_controller.dart';
import 'package:pray_app/app/modules/auth/login/widgets/login_forgot_password_button.dart';
import 'package:pray_app/app/modules/auth/login/widgets/login_header.dart';
import 'package:pray_app/app/modules/auth/login/widgets/login_signup_prompt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<LoginPageController>();
  }

  Future<void> _loginOnPressed() async {
    if (_controller.isLoading) {
      return;
    }

    if (_controller.formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      await _controller.login(deviceToken: 'abc123xyz_device_token_opcional');

      if (!mounted) {
        return;
      }

      if (_controller.errorMessage != null) {
        debugPrint('Login page showing error: ${_controller.errorMessage}');
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            SnackBar(
              content: Text(_controller.errorMessage!),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );

        _controller.clearError();
        return;
      }

      GoRouter.of(context).goNamed(AppRoutes.splashName);
    }
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: _controller.formKey,
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const LoginHeader(),
                      const SizedBox(height: 48),
                      EmailTextField(controller: _controller.emailController),
                      const SizedBox(height: 20),
                      PasswordTextField(
                        controller: _controller.passwordController,
                      ),
                      const SizedBox(height: 12),
                      LoginForgotPasswordButton(onPressed: () {}),
                      const SizedBox(height: 32),
                      AppButton(
                        label: 'Entrar',
                        isLoading: _controller.isLoading,
                        onPressed: () => _loginOnPressed(),
                      ),
                      const SizedBox(height: 24),
                      LoginSignupPrompt(
                        onTap: () {
                          // TODO: navegar para cadastro.
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
