import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pray_app/l10n/app_localizations.dart';
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

  final List<IconData> _phaseIcons = [
    Icons.auto_awesome,
    Icons.create,
    Icons.star_rate,
  ];

  @override
  void initState() {
    super.initState();
    _startPhaseTimer();
  }

  void _startPhaseTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (mounted && _currentPhase < _phaseIcons.length - 1) {
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
    final phaseMessages = [
      AppLocalizations.of(context)!.generatingPhase1,
      AppLocalizations.of(context)!.generatingPhase2,
      AppLocalizations.of(context)!.generatingPhase3,
    ];

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
                _phaseIcons[_currentPhase],
                size: 48,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              phaseMessages[_currentPhase],
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
              AppLocalizations.of(context)!.generatingTimeEstimate,
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
