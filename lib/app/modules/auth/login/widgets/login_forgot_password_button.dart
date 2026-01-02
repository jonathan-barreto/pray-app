import 'package:flutter/material.dart';

class LoginForgotPasswordButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const LoginForgotPasswordButton({
    super.key,
    required this.onPressed,
    this.label = 'Esqueci minha senha',
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
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
