import 'package:flutter/material.dart';
import 'package:pray_app/l10n/app_localizations.dart';

class RegisterHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const RegisterHeader({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? AppLocalizations.of(context)!.registerTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle ?? AppLocalizations.of(context)!.registerSubtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
        ),
      ],
    );
  }
}
