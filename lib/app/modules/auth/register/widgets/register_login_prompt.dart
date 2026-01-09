import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterLoginPrompt extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onTap;

  const RegisterLoginPrompt({
    super.key,
    this.questionText = 'Já tem uma conta? ',
    this.actionText = 'Entre agora',
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
            TextSpan(text: questionText),
            TextSpan(
              text: actionText,
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
