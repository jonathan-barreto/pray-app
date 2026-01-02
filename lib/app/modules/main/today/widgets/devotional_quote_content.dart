import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';

class DevotionalQuoteContent extends StatelessWidget {
  final DevotionalEntity? devotional;

  const DevotionalQuoteContent({super.key, this.devotional});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          devotional?.verseReference ?? 'Citação diária',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          devotional?.description ?? 'Carregando descrição...',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
