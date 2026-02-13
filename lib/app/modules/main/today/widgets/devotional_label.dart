import 'package:flutter/material.dart';

import 'package:pray_app/l10n/app_localizations.dart';

class DevotionalLabel extends StatelessWidget {
  const DevotionalLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.dailyDevotional,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
