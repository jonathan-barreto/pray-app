import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class DevotionalReadingTime extends StatelessWidget {
  final int minutes;

  const DevotionalReadingTime({
    super.key,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time_outlined,
          size: 16,
          color: AppColors.textMuted,
        ),
        const SizedBox(width: 6),
        Text(
          '$minutes min',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textMuted,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
