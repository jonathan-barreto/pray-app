import 'package:flutter/material.dart';
import 'package:pray_app/l10n/app_localizations.dart';

class LoginForgotPasswordButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label;

  const LoginForgotPasswordButton({
    super.key,
    required this.onPressed,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        ),
        child: Text(
          label ?? AppLocalizations.of(context)!.loginForgotPassword,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
