import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/core/utils/date_formatter.dart';

class CardHeader extends StatelessWidget {
  final IconData icon;
  final String label;
  final int readingTimeMinutes;
  final DateTime? date;
  final bool showFavorite;
  final VoidCallback? onFavoritePressed;
  final bool isFavorite;

  const CardHeader({
    super.key,
    required this.icon,
    required this.label,
    required this.readingTimeMinutes,
    this.date,
    this.showFavorite = true,
    this.onFavoritePressed,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              if (date != null) ...[
                Text(
                  DateFormatter.formatDate(date!.toIso8601String()),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 8),
              ],
              Row(
                children: [
                  Icon(
                    icon,
                    size: 16,
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
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$readingTimeMinutes min',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (showFavorite) ...[
          const SizedBox(width: 16),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              onPressed: onFavoritePressed,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ],
    );
  }
}
