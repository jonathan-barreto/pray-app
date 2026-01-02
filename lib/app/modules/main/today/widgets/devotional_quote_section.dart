import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/modules/main/today/widgets/card_action_buttons.dart';
import 'package:pray_app/app/modules/main/today/widgets/devotional_quote_content.dart';
import 'package:pray_app/app/modules/main/today/widgets/devotional_quote_icon.dart';

class DevotionalQuoteSection extends StatelessWidget {
  final DevotionalEntity? devotional;
  final VoidCallback? onAccessPressed;

  const DevotionalQuoteSection({
    super.key,
    this.devotional,
    this.onAccessPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const DevotionalQuoteIcon(),
            const SizedBox(width: 16),
            Expanded(child: DevotionalQuoteContent(devotional: devotional)),
          ],
        ),
        const SizedBox(height: 20),
        CardActionButtons(
          onReadPressed: onAccessPressed,
        ),
      ],
    );
  }
}
