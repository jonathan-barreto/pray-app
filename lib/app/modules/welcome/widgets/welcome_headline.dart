import 'package:flutter/material.dart';

import 'package:pray_app/l10n/app_localizations.dart';

class WelcomeHeadline extends StatelessWidget {
  final String? title;

  const WelcomeHeadline({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title ?? AppLocalizations.of(context)!.welcomeHeadline,
        style: textTheme.displaySmall?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
          height: 1.1,
        ),
      ),
    );
  }
}
