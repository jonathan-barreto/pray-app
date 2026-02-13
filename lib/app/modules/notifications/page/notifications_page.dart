import 'package:flutter/material.dart';
import 'package:pray_app/l10n/app_localizations.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _dailyDevotional = true;
  bool _newContent = true;
  bool _achievements = false;
  bool _reminders = true;
  bool _emailNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notificationsAppBar),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(24),
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
                  Icons.notifications_active_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.notificationsDescription,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.notificationsPushSection,
            items: [
              _buildSwitchTile(
                context,
                title:
                    AppLocalizations.of(context)!.notificationsDailyDevotional,
                subtitle: AppLocalizations.of(context)!
                    .notificationsDailyDevotionalSubtitle,
                value: _dailyDevotional,
                onChanged: (value) {
                  setState(() {
                    _dailyDevotional = value;
                  });
                },
              ),
              _buildSwitchTile(
                context,
                title: AppLocalizations.of(context)!.notificationsNewContent,
                subtitle: AppLocalizations.of(context)!
                    .notificationsNewContentSubtitle,
                value: _newContent,
                onChanged: (value) {
                  setState(() {
                    _newContent = value;
                  });
                },
              ),
              _buildSwitchTile(
                context,
                title: AppLocalizations.of(context)!.notificationsAchievements,
                subtitle: AppLocalizations.of(context)!
                    .notificationsAchievementsSubtitle,
                value: _achievements,
                onChanged: (value) {
                  setState(() {
                    _achievements = value;
                  });
                },
              ),
              _buildSwitchTile(
                context,
                title: AppLocalizations.of(context)!.notificationsReminders,
                subtitle: AppLocalizations.of(context)!
                    .notificationsRemindersSubtitle,
                value: _reminders,
                onChanged: (value) {
                  setState(() {
                    _reminders = value;
                  });
                },
              ),
            ],
          ),
          _buildSection(
            context,
            title: AppLocalizations.of(context)!.notificationsEmailSection,
            items: [
              _buildSwitchTile(
                context,
                title: AppLocalizations.of(context)!.notificationsEmailToggle,
                subtitle: AppLocalizations.of(context)!
                    .notificationsEmailToggleSubtitle,
                value: _emailNotifications,
                onChanged: (value) {
                  setState(() {
                    _emailNotifications = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                ),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
