import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class TodayHeader extends StatelessWidget {
  final String greeting;

  const TodayHeader({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greeting,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            fontSize: 28,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Mantenha sua chama acesa, cada dia é uma nova oportunidade de se conectar com Deus.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
