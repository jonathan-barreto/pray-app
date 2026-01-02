import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/modules/main/my_devotional/widgets/devotional_card_with_action.dart';
import 'package:pray_app/app/modules/main/my_devotional/widgets/devotional_empty_state.dart';
import 'package:pray_app/app/modules/main/my_devotional/widgets/devotional_loading_state.dart';

class MyDevotionalHistorySection extends StatelessWidget {
  final DevotionalEntity? lastDevotional;
  final bool isLoading;
  final VoidCallback? onAccessPressed;

  const MyDevotionalHistorySection({
    super.key,
    this.lastDevotional,
    this.isLoading = false,
    this.onAccessPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.history, color: AppColors.primary, size: 24),
            const SizedBox(width: 12),
            Text(
              'Histórico',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Acesse todos os devocionais personalizados que você já criou. Seu último devocional aparecerá aqui.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        if (isLoading)
          const DevotionalLoadingState()
        else if (lastDevotional != null)
          DevotionalCardWithAction(
            devotional: lastDevotional!,
            onAccessPressed: onAccessPressed,
          )
        else
          const DevotionalEmptyState(),
      ],
    );
  }
}
