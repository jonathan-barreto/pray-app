import 'package:flutter/material.dart';

class DevotionalFavoriteButton extends StatelessWidget {
  const DevotionalFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        Icons.favorite_border,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
