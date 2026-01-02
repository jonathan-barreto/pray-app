import 'package:flutter/material.dart';
import 'package:pray_app/app/core/utils/date_formatter.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/modules/main/today/widgets/devotional_favorite_button.dart';
import 'package:pray_app/app/modules/main/today/widgets/devotional_label.dart';

class DevotionalHeader extends StatelessWidget {
  final DevotionalEntity? devotional;

  const DevotionalHeader({super.key, this.devotional});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormatter.formatDate(devotional?.createdAt),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const DevotionalLabel(),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const DevotionalFavoriteButton(),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                devotional?.title ?? 'Carregando...',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
