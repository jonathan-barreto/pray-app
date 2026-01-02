import 'package:flutter/material.dart';

class DevotionalQuoteIcon extends StatelessWidget {
  const DevotionalQuoteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        Icons.format_quote,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
