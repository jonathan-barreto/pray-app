import 'package:flutter/material.dart';

class WelcomeHeadline extends StatelessWidget {
  final String title;

  const WelcomeHeadline({super.key, this.title = 'Bem-vindo(a)\nao Pray!'});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: textTheme.displaySmall?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
          height: 1.1,
        ),
      ),
    );
  }
}
