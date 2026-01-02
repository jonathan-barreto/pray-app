import 'package:flutter/material.dart';
import 'package:pray_app/app/core/widgets/devotional_header.dart';
import 'package:pray_app/app/core/widgets/devotional_quote_section.dart';
import 'package:pray_app/app/core/widgets/elevated_card.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';

class DevotionalCard extends StatelessWidget {
  final DevotionalEntity? devotional;
  final VoidCallback? onAccessPressed;
  final VoidCallback? onFavoritePressed;
  final bool showFavorite;
  final bool showLabel;
  final bool? isFavorite;

  const DevotionalCard({
    super.key,
    this.devotional,
    this.onAccessPressed,
    this.onFavoritePressed,
    this.showFavorite = true,
    this.showLabel = true,
    this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DevotionalHeader(
            devotional: devotional,
            showFavorite: showFavorite,
            showLabel: showLabel,
            onFavoritePressed: onFavoritePressed,
            isFavorite: isFavorite,
          ),
          const SizedBox(height: 16),
          DevotionalQuoteSection(
            devotional: devotional,
            onAccessPressed: onAccessPressed,
          ),
        ],
      ),
    );
  }
}
