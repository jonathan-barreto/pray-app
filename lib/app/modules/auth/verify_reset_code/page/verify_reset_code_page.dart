import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pray_app/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/core/widgets/error_dialog.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/auth/verify_reset_code/controller/verify_reset_code_controller.dart';

class VerifyResetCodePage extends StatefulWidget {
  final String email;

  const VerifyResetCodePage({super.key, required this.email});

  @override
  State<VerifyResetCodePage> createState() => _VerifyResetCodePageState();
}

class _VerifyResetCodePageState extends State<VerifyResetCodePage> {
  final _formKey = GlobalKey<FormState>();
  late final VerifyResetCodeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<VerifyResetCodeController>();
  }

  Future<void> _verifyCodeOnPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      _controller.validateCode();

      if (_controller.errorMessage != null) {
        await ErrorDialog.show(
          context,
          message: _controller.errorMessage!,
        );

        _controller.clearError();
        return;
      }

      GoRouter.of(context).push(
        AppRoutes.resetPassword,
        extra: {
          'email': widget.email,
          'code': _controller.codeController.text.trim(),
        },
      );
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
        title: Text(AppLocalizations.of(context)!.verifyCodeAppBar),
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
                      AppLocalizations.of(context)!.verifyCodeTitle,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!
                          .verifyCodeSubtitle(widget.email),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _controller.codeController,
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context)!.verifyCodeLabel,
                        hintText: AppLocalizations.of(context)!.verifyCodeHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 8,
                              ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.verifyCodeEmpty;
                        }
                        if (value.length != 6) {
                          return AppLocalizations.of(context)!
                              .verifyCodeInvalid;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    AppButton(
                      label: AppLocalizations.of(context)!.verifyCodeButton,
                      onPressed: _verifyCodeOnPressed,
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
