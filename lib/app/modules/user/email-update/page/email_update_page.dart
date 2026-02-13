import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:pray_app/l10n/app_localizations.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/core/widgets/app_text_field.dart';
import 'package:pray_app/app/core/widgets/password_text_field.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/user/email-update/controller/email_update_controller.dart';

class EmailUpdatePage extends StatefulWidget {
  const EmailUpdatePage({super.key});

  @override
  State<EmailUpdatePage> createState() => _EmailUpdatePageState();
}

class _EmailUpdatePageState extends State<EmailUpdatePage> {
  late final EmailUpdateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<EmailUpdateController>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _updateEmail() async {
    FocusScope.of(context).unfocus();

    final success = await _controller.updateEmail();

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.emailUpdateSuccess,
            ),
          ),
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
        title: Text(AppLocalizations.of(context)!.emailUpdateAppBar),
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
                      AppLocalizations.of(context)!.emailUpdateTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.emailUpdateSubtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      controller: _controller.emailController,
                      hintText:
                          AppLocalizations.of(context)!.emailUpdateNewHint,
                      prefixIcon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.emailUpdateEmpty;
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return AppLocalizations.of(context)!
                              .emailUpdateInvalid;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    PasswordTextField(
                      controller: _controller.passwordController,
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .emailUpdateCurrentPassword),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .emailUpdatePasswordEmpty;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      label: AppLocalizations.of(context)!.emailUpdateButton,
                      onPressed: _updateEmail,
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
