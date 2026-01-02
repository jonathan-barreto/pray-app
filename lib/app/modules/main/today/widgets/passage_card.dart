import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/core/widgets/card_header.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';
import 'package:pray_app/app/modules/main/today/widgets/card_action_buttons.dart';
import 'package:pray_app/app/modules/main/today/widgets/today_elevated_card.dart';

class PassageCard extends StatelessWidget {
  final PassageEntity? passage;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onReadPressed;
  final bool? isFavorite;

  const PassageCard({
    super.key,
    this.passage,
    this.onFavoritePressed,
    this.onReadPressed,
    this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return TodayElevatedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeader(
            icon: Icons.menu_book_outlined,
            label: 'Passagem do Dia',
            readingTimeMinutes: passage?.readingTimeEstimate ?? 1,
            date: passage?.createdAt != null
                ? DateTime.tryParse(passage!.createdAt)
                : null,
            showFavorite: true,
            isFavorite: isFavorite ?? (passage?.liked ?? false),
            onFavoritePressed: onFavoritePressed,
          ),
          const SizedBox(height: 16),
          Text(
            passage?.verseReference ?? 'Carregando...',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            passage?.verseText.replaceAll('<br>', ' ') ??
                'Carregando texto do versículo...',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          CardActionButtons(
            onReadPressed: passage != null ? onReadPressed : null,
          ),
        ],
      ),
    );
  }
}
