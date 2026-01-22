import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/core/widgets/error_dialog.dart';
import 'package:pray_app/app/core/widgets/password_text_field.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/auth/reset_password/controller/reset_password_controller.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  final String code;

  const ResetPasswordPage({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final ResetPasswordController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<ResetPasswordController>();
  }

  Future<void> _resetPasswordOnPressed() async {
    if (_controller.isLoading) {
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      await _controller.resetPassword(
        email: widget.email,
        code: widget.code,
      );

      if (!mounted) {
        return;
      }

      if (_controller.errorMessage != null) {
        await ErrorDialog.show(
          context,
          message: _controller.errorMessage!,
        );

        _controller.clearError();
      }

      if (_controller.successMessage != null) {
        _controller.clearSuccess();

        if (mounted) {
          GoRouter.of(context).go(AppRoutes.login);
        }
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
      appBar: AppBar(
        title: const Text('Nova Senha'),
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Criar nova senha',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Digite sua nova senha. Certifique-se de que seja segura e fácil de lembrar.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 32),
                    PasswordTextField(
                      controller: _controller.passwordController,
                      decoration:
                          const InputDecoration(labelText: 'Nova Senha'),
                      enabled: !_controller.isLoading,
                    ),
                    const SizedBox(height: 16),
                    PasswordTextField(
                      controller: _controller.confirmPasswordController,
                      decoration:
                          const InputDecoration(labelText: 'Confirmar Senha'),
                      enabled: !_controller.isLoading,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirme sua senha';
                        }
                        if (value != _controller.passwordController.text) {
                          return 'As senhas não coincidem';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    AppButton(
                      label: 'Redefinir Senha',
                      onPressed: _resetPasswordOnPressed,
                      isLoading: _controller.isLoading,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
