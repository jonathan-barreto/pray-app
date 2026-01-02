import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class GeneratingMyDevotionalModal extends StatefulWidget {
  const GeneratingMyDevotionalModal({super.key});

  @override
  State<GeneratingMyDevotionalModal> createState() =>
      _GeneratingMyDevotionalModalState();
}

class _GeneratingMyDevotionalModalState
    extends State<GeneratingMyDevotionalModal> {
  int _currentPhase = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> _phases = [
    {
      'icon': Icons.auto_awesome,
      'message': 'Analisando seus sentimentos...',
      'duration': 10,
    },
    {
      'icon': Icons.create,
      'message': 'Tecendo uma reflexão feita especialmente para você...',
      'duration': 10,
    },
    {
      'icon': Icons.star_rate,
      'message': 'Aprimorando cada detalhe em um devocional único...',
      'duration': 10,
    },
  ];

  @override
  void initState() {
    super.initState();
    _startPhaseTimer();
  }

  void _startPhaseTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (mounted && _currentPhase < _phases.length - 1) {
        setState(() {
          _currentPhase++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phase = _phases[_currentPhase];

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                phase['icon'] as IconData,
                size: 48,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              phase['message'] as String,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Isso pode levar até 1 minuto',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
