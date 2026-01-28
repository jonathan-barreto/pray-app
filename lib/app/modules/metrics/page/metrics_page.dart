import 'package:flutter/material.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/metrics/controller/metrics_page_controller.dart';
import 'package:pray_app/app/modules/metrics/widgets/metric_card.dart';
import 'package:pray_app/app/modules/metrics/widgets/metrics_header.dart';
import 'package:pray_app/app/modules/metrics/widgets/streak_section.dart';

class MetricsPage extends StatefulWidget {
  const MetricsPage({super.key});

  @override
  State<MetricsPage> createState() => _MetricsPageState();
}

class _MetricsPageState extends State<MetricsPage> {
  late final MetricsPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<MetricsPageController>();
    _loadMetrics();
  }

  Future<void> _loadMetrics() async {
    final userId = AppController.instance.userProfile?.id;

    if (userId == null) {
      return;
    }

    await _controller.loadMetrics(userId: userId);

    if (!mounted) {
      return;
    }

    if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(content: Text(_controller.errorMessage!)),
        );

      _controller.clearError();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final metrics = _controller.metrics;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Minhas Métricas'),
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: _controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          MetricsHeader(
                            userName:
                                AppController.instance.userProfile?.name ?? '',
                            userInitials: AppController.instance.userProfile
                                    ?.getInitials() ??
                                '',
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
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
      },
    );
  }
}
