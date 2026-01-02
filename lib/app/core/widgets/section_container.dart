import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onSeeMorePressed;
  final String? seeMoreButtonText;

  const SectionContainer({
    super.key,
    required this.child,
    this.onSeeMorePressed,
    this.seeMoreButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          child,
          if (onSeeMorePressed != null) ...[
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: onSeeMorePressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(seeMoreButtonText ?? 'Ver Mais'),
            ),
          ],
        ],
      ),
    );
  }
}
