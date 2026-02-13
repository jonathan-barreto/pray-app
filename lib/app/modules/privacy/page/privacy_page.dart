import 'package:flutter/material.dart';

import 'package:pray_app/l10n/app_localizations.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.privacyAppBar),
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
                  Icons.lock_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.privacyBanner,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.privacyDataTitle,
            content: AppLocalizations.of(context)!.privacyDataContent,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.privacyUsageTitle,
            content: AppLocalizations.of(context)!.privacyUsageContent,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.privacySharedTitle,
            content: AppLocalizations.of(context)!.privacySharedContent,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.privacyAiTitle,
            content: AppLocalizations.of(context)!.privacyAiContent,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.privacyDeleteTitle,
            content: AppLocalizations.of(context)!.privacyDeleteContent,
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.privacySecurityTitle,
            content: AppLocalizations.of(context)!.privacySecurityContent,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.privacyLastUpdate,
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
