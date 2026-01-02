import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_body_text.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_reading_time.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_swipe_indicator.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_title.dart';

class DevotionalFirstPage extends StatelessWidget {
  final DevotionalEntity devotional;

  const DevotionalFirstPage({
    super.key,
    required this.devotional,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DevotionalReadingTime(
            minutes: devotional.readingTimeEstimate,
          ),
          const SizedBox(height: 28),
          DevotionalTitle(title: devotional.title),
          const SizedBox(height: 24),
          DevotionalBodyText(text: devotional.description),
          const SizedBox(height: 60),
          const DevotionalSwipeIndicator(),
        ],
      ),
    );
  }
}
