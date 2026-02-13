import 'package:flutter/material.dart';
import 'package:pray_app/l10n/app_localizations.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helpAppBar),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.book_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.helpFaqTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildFaqItem(
            context,
            question: AppLocalizations.of(context)!.helpQ1,
            answer: AppLocalizations.of(context)!.helpA1,
          ),
          _buildFaqItem(
            context,
            question: AppLocalizations.of(context)!.helpQ2,
            answer: AppLocalizations.of(context)!.helpA2,
          ),
          _buildFaqItem(
            context,
            question: AppLocalizations.of(context)!.helpQ3,
            answer: AppLocalizations.of(context)!.helpA3,
          ),
          _buildFaqItem(
            context,
            question: AppLocalizations.of(context)!.helpQ4,
            answer: AppLocalizations.of(context)!.helpA4,
          ),
          _buildFaqItem(
            context,
            question: AppLocalizations.of(context)!.helpQ5,
            answer: AppLocalizations.of(context)!.helpA5,
          ),
          _buildFaqItem(
            context,
            question: AppLocalizations.of(context)!.helpQ6,
            answer: AppLocalizations.of(context)!.helpA6,
          ),
          _buildFaqItem(
            context,
            question: AppLocalizations.of(context)!.helpQ7,
            answer: AppLocalizations.of(context)!.helpA7,
          ),
          _buildFaqItem(
            context,
            question: AppLocalizations.of(context)!.helpQ8,
            answer: AppLocalizations.of(context)!.helpA8,
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem(
    BuildContext context, {
    required String question,
    required String answer,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.primaryContainer.withValues(alpha: 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Text(
          question,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              answer,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
