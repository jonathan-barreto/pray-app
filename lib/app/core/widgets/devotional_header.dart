import 'package:flutter/material.dart';
import 'package:pray_app/app/core/widgets/card_header.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';

class DevotionalHeader extends StatelessWidget {
  final DevotionalEntity? devotional;
  final bool showFavorite;
  final bool showLabel;
  final VoidCallback? onFavoritePressed;
  final bool? isFavorite;

  const DevotionalHeader({
    super.key,
    this.devotional,
    this.showFavorite = true,
    this.showLabel = true,
    this.onFavoritePressed,
    this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardHeader(
          icon: Icons.menu_book_outlined,
          label: showLabel ? 'Devocional diário' : 'Devocional',
          readingTimeMinutes: devotional?.readingTimeEstimate ?? 2,
          date: devotional?.createdAt != null
              ? DateTime.tryParse(devotional!.createdAt)
              : null,
          showFavorite: showFavorite,
          isFavorite: isFavorite ?? (devotional?.liked ?? false),
          onFavoritePressed: onFavoritePressed,
        ),
        const SizedBox(height: 16),
        Text(
          devotional?.title ?? 'Carregando...',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
