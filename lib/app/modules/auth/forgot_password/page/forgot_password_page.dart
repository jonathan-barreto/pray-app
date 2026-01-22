import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/core/widgets/email_text_field.dart';
import 'package:pray_app/app/core/widgets/error_dialog.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/auth/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final ForgotPasswordController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<ForgotPasswordController>();
  }

  Future<void> _requestResetOnPressed() async {
    if (_controller.isLoading) {
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      await _controller.requestPasswordReset();

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

        GoRouter.of(context).push(
          AppRoutes.verifyResetCode,
          extra: {'email': _controller.emailController.text.trim()},
        );
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text('Recuperar Senha'),
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
                        'Esqueceu sua senha?',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Digite seu email e enviaremos um código de verificação para redefinir sua senha.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                      const SizedBox(height: 32),
                      EmailTextField(
                        controller: _controller.emailController,
                        enabled: !_controller.isLoading,
                      ),
                      const SizedBox(height: 32),
                      AppButton(
                        label: 'Enviar Código',
                        onPressed: _requestResetOnPressed,
                        isLoading: _controller.isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
