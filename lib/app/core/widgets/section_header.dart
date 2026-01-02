import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String description;
  final IconData? icon;

  const SectionHeader({
    super.key,
    required this.title,
    required this.description,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.primary, size: 24),
              const SizedBox(width: 12),
            ],
            Text(
              title,
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
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.5,
              ),
        ),
      ],
    );
  }
}
