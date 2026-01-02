import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_body_text.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_section_header.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_swipe_indicator.dart';

class DevotionalThirdPage extends StatelessWidget {
  final DevotionalEntity devotional;

  const DevotionalThirdPage({
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
          if (devotional.reflection.isNotEmpty) ...[
            const DevotionalSectionHeader(
              title: 'Reflexão',
              icon: Icons.lightbulb_outline,
            ),
            const SizedBox(height: 24),
            DevotionalBodyText(text: devotional.reflection),
            const SizedBox(height: 48),
          ],
          if (devotional.application.isNotEmpty) ...[
            const DevotionalSectionHeader(
              title: 'Aplicação',
              icon: Icons.psychology_outlined,
            ),
            const SizedBox(height: 24),
            DevotionalBodyText(text: devotional.application),
          ],
          const SizedBox(height: 60),
          const DevotionalSwipeIndicator(),
        ],
      ),
    );
  }
}
