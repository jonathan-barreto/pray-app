import 'package:flutter/material.dart';

class WelcomeDescription extends StatelessWidget {
  final String description;

  const WelcomeDescription({
    super.key,
    this.description =
        'Descubra devocionais criados especialmente para você. Reflita, ore e fortaleça sua caminhada com Deus todos os dias.',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        description,
        style: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
