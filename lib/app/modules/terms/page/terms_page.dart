import 'package:flutter/material.dart';

import 'package:pray_app/l10n/app_localizations.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.termsAppBar),
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
                  Icons.description_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.termsBanner,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context)!.termsIntro,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection1Title,
            content: AppLocalizations.of(context)!.termsSection1Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection2Title,
            content: AppLocalizations.of(context)!.termsSection2Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection3Title,
            content: AppLocalizations.of(context)!.termsSection3Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection4Title,
            content: AppLocalizations.of(context)!.termsSection4Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection5Title,
            content: AppLocalizations.of(context)!.termsSection5Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection6Title,
            content: AppLocalizations.of(context)!.termsSection6Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection7Title,
            content: AppLocalizations.of(context)!.termsSection7Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection8Title,
            content: AppLocalizations.of(context)!.termsSection8Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection9Title,
            content: AppLocalizations.of(context)!.termsSection9Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection10Title,
            content: AppLocalizations.of(context)!.termsSection10Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection11Title,
            content: AppLocalizations.of(context)!.termsSection11Content,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.termsSection12Title,
            content: AppLocalizations.of(context)!.termsSection12Content,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.termsLastUpdate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.primaryContainer.withValues(alpha: 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
          ),
        ],
      ),
    );
  }
}
