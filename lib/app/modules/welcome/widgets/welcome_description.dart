import 'package:flutter/material.dart';

import 'package:pray_app/l10n/app_localizations.dart';

class WelcomeDescription extends StatelessWidget {
  final String? description;

  const WelcomeDescription({
    super.key,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        description ?? AppLocalizations.of(context)!.welcomeDescription,
        style: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
