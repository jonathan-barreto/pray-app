import 'package:flutter/material.dart';

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
        title: const Text('Notificações'),
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
                    'Personalize suas notificações para não perder nenhum conteúdo importante.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          _buildSection(
            context,
            title: 'Notificações Push',
            items: [
              _buildSwitchTile(
                context,
                title: 'Devocional Diário',
                subtitle: 'Receba lembretes do devocional do dia',
                value: _dailyDevotional,
                onChanged: (value) {
                  setState(() {
                    _dailyDevotional = value;
                  });
                },
              ),
              _buildSwitchTile(
                context,
                title: 'Novo Conteúdo',
                subtitle: 'Notificações sobre novos devocionais',
                value: _newContent,
                onChanged: (value) {
                  setState(() {
                    _newContent = value;
                  });
                },
              ),
              _buildSwitchTile(
                context,
                title: 'Conquistas',
                subtitle: 'Receba notificações de conquistas',
                value: _achievements,
                onChanged: (value) {
                  setState(() {
                    _achievements = value;
                  });
                },
              ),
              _buildSwitchTile(
                context,
                title: 'Lembretes',
                subtitle: 'Lembretes personalizados',
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
            title: 'E-mail',
            items: [
              _buildSwitchTile(
                context,
                title: 'Notificações por E-mail',
                subtitle: 'Receba atualizações por e-mail',
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
