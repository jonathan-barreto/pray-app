import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:pray_app/l10n/app_localizations.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/core/widgets/password_text_field.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/user/password-update/controller/password_update_controller.dart';

class PasswordUpdatePage extends StatefulWidget {
  const PasswordUpdatePage({super.key});

  @override
  State<PasswordUpdatePage> createState() => _PasswordUpdatePageState();
}

class _PasswordUpdatePageState extends State<PasswordUpdatePage> {
  late final PasswordUpdateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<PasswordUpdateController>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _updatePassword() async {
    FocusScope.of(context).unfocus();

    final success = await _controller.updatePassword();

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
              content:
                  Text(AppLocalizations.of(context)!.passwordUpdateSuccess)),
        );
      GoRouter.of(context).go(AppRoutes.splash);
    } else if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(_controller.errorMessage!)));
      _controller.clearError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.passwordUpdateAppBar),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Form(
                key: _controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.passwordUpdateTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.passwordUpdateSubtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 24),
                    PasswordTextField(
                      controller: _controller.currentPasswordController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!
                            .passwordUpdateCurrentLabel,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .passwordUpdateCurrentEmpty;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    PasswordTextField(
                      controller: _controller.newPasswordController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!
                            .passwordUpdateNewLabel,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .passwordUpdateNewEmpty;
                        }
                        if (value.length < 6) {
                          return AppLocalizations.of(context)!
                              .passwordUpdateMinLength;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    PasswordTextField(
                      controller: _controller.confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!
                            .passwordUpdateConfirmLabel,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .passwordUpdateConfirmEmpty;
                        }
                        if (value != _controller.newPasswordController.text) {
                          return AppLocalizations.of(context)!
                              .passwordUpdateMismatch;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      label: AppLocalizations.of(context)!.passwordUpdateButton,
                      onPressed: _updatePassword,
                      isLoading: _controller.isLoading,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
