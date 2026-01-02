import 'package:flutter/material.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/modules/metrics/widgets/metric_card.dart';
import 'package:pray_app/app/modules/metrics/widgets/metrics_header.dart';
import 'package:pray_app/app/modules/metrics/widgets/streak_section.dart';

class MetricsPage extends StatelessWidget {
  const MetricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = AppController.instance.userProfile?.metrics;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Métricas'),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                MetricsHeader(
                  userName: AppController.instance.userProfile?.name ?? '',
                  userInitials:
                      AppController.instance.userProfile?.getInitials() ?? '',
                ),
                const SizedBox(height: 24),
                StreakSection(
                  streakDays: metrics?.streakDays ?? 0,
                  streakMonths: metrics?.streakMonths ?? 0,
                  streakYears: metrics?.streakYears ?? 0,
                  longestStreak: metrics?.longestStreak ?? 0,
                ),
                const SizedBox(height: 32),
                Text(
                  'Progresso',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                MetricCard(
                  icon: Icons.auto_stories_outlined,
                  title: 'Devocionais Completos',
                  value: '${metrics?.devotionalsCompleted ?? 0}',
                  subtitle: 'Total de devocionais concluídos',
                ),
                const SizedBox(height: 16),
                MetricCard(
                  icon: Icons.menu_book_outlined,
                  title: 'Passagens Completas',
                  value: '${metrics?.passagesCompleted ?? 0}',
                  subtitle: 'Total de passagens concluídas',
                ),
                const SizedBox(height: 16),
                MetricCard(
                  icon: Icons.emoji_events_outlined,
                  title: 'Ranking',
                  value: metrics?.rankPosition != null
                      ? '#${metrics!.rankPosition}'
                      : 'N/A',
                  subtitle: 'Sua posição no ranking global',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
