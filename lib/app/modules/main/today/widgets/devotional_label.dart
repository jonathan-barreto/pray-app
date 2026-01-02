import 'package:flutter/material.dart';

class DevotionalLabel extends StatelessWidget {
  const DevotionalLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Devocional diário',
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
