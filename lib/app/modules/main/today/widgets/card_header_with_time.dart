import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class CardHeaderWithTime extends StatelessWidget {
  final IconData icon;
  final String label;
  final int readingTimeMinutes;

  const CardHeaderWithTime({
    super.key,
    required this.icon,
    required this.label,
    required this.readingTimeMinutes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.primary,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Icon(
          Icons.access_time_outlined,
          size: 14,
          color: AppColors.textMuted,
        ),
        const SizedBox(width: 4),
        Text(
          '$readingTimeMinutes min',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textMuted,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
