import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/devotional_card.dart';
import 'package:pray_app/app/core/widgets/section_header.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';

class MyFavoritesSection extends StatelessWidget {
  final DevotionalEntity? devotional;

  const MyFavoritesSection({
    super.key,
    this.devotional,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          icon: Icons.favorite,
          title: 'Meus Favoritos',
          description: 'Devocionais personalizados que você marcou como favoritos',
        ),
        const SizedBox(height: 20),
        if (devotional != null) ...[
          DevotionalCard(
            devotional: devotional,
            showFavorite: false,
            showLabel: false,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRoutes.privateDevotionalsName);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Ver Mais Devocionais',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ] else
          _buildEmptyState(context),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'Nenhum favorito ainda',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textMuted,
              ),
        ),
      ),
    );
  }
}
