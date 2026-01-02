import 'package:flutter/material.dart';
import 'package:pray_app/app/core/utils/text_formatter.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';

class PassageContent extends StatelessWidget {
  final PassageEntity passage;

  const PassageContent({super.key, required this.passage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        TextFormatter.formatPassageText(passage.verseText),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          height: 1.6,
          fontSize: 18,
        ),
      ),
    );
  }
}
