import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class DevotionalSwipeIndicator extends StatelessWidget {
  const DevotionalSwipeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Deslize para continuar',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          Icon(
            Icons.arrow_forward,
            color: AppColors.textMuted,
            size: 18,
          ),
        ],
      ),
    );
  }
}
