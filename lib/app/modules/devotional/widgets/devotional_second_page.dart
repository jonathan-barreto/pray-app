import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/core/utils/text_formatter.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_swipe_indicator.dart';

class DevotionalSecondPage extends StatelessWidget {
  final DevotionalEntity devotional;

  const DevotionalSecondPage({super.key, required this.devotional});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.auto_stories_outlined, size: 48, color: AppColors.primary),
          const SizedBox(height: 32),
          Text(
            devotional.verseReference,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontSize: 26,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Text(
            TextFormatter.formatHtmlText(devotional.verseText),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.7,
              color: AppColors.textSecondary,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 60),
          const DevotionalSwipeIndicator(),
        ],
      ),
    );
  }
}
