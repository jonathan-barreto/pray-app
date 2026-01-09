import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/core/widgets/email_text_field.dart';
import 'package:pray_app/app/core/widgets/name_text_field.dart';
import 'package:pray_app/app/core/widgets/password_text_field.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/auth/register/controller/register_page_controller.dart';
import 'package:pray_app/app/modules/auth/register/widgets/register_header.dart';
import 'package:pray_app/app/modules/auth/register/widgets/register_login_prompt.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<RegisterPageController>();
  }

  Future<void> _registerOnPressed() async {
    if (_controller.isLoading) {
      return;
    }

    if (_controller.formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      await _controller.register(deviceToken: 'device_token');

      if (!mounted) {
        return;
      }

      if (_controller.errorMessage != null) {
        debugPrint('Register page showing error: ${_controller.errorMessage}');
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

      if (_controller.registrationSuccess) {
        GoRouter.of(context).go(AppRoutes.splash);
      }
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
                      const RegisterHeader(),
                      const SizedBox(height: 48),
                      NameTextField(controller: _controller.nameController),
                      const SizedBox(height: 20),
                      EmailTextField(controller: _controller.emailController),
                      const SizedBox(height: 20),
                      PasswordTextField(
                        controller: _controller.passwordController,
                      ),
                      const SizedBox(height: 32),
                      AppButton(
                        label: 'Cadastrar',
                        isLoading: _controller.isLoading,
                        onPressed: () => _registerOnPressed(),
                      ),
                      const SizedBox(height: 24),
                      RegisterLoginPrompt(
                        onTap: () {
                          GoRouter.of(context).go(AppRoutes.login);
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
