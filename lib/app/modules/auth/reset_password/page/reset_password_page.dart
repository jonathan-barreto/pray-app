import 'package:flutter/material.dart';

import 'package:pray_app/l10n/app_localizations.dart';
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
        title: Text(AppLocalizations.of(context)!.resetPasswordAppBar),
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
                      AppLocalizations.of(context)!.resetPasswordTitle,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.resetPasswordSubtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 32),
                    PasswordTextField(
                      controller: _controller.passwordController,
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .resetPasswordNewLabel),
                      enabled: !_controller.isLoading,
                    ),
                    const SizedBox(height: 16),
                    PasswordTextField(
                      controller: _controller.confirmPasswordController,
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .resetPasswordConfirmLabel),
                      enabled: !_controller.isLoading,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .resetPasswordConfirmEmpty;
                        }
                        if (value != _controller.passwordController.text) {
                          return AppLocalizations.of(context)!
                              .resetPasswordMismatch;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    AppButton(
                      label: AppLocalizations.of(context)!.resetPasswordButton,
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
