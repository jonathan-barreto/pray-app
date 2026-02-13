import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pray_app/l10n/app_localizations.dart';

class LoginSignupPrompt extends StatelessWidget {
  final String? questionText;
  final String? actionText;
  final VoidCallback onTap;

  const LoginSignupPrompt({
    super.key,
    this.questionText,
    this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
          children: [
            TextSpan(
                text: questionText ??
                    AppLocalizations.of(context)!.loginNoAccount),
            TextSpan(
              text: actionText ?? AppLocalizations.of(context)!.loginSignUp,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
