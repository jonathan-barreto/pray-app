import 'package:flutter/material.dart';

import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/l10n/app_localizations.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const LanguageDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = AppController.instance.locale;

    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(AppLocalizations.of(context)!.languageAppBar),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.languageDescription,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
          ),
          const SizedBox(height: 24),
          RadioListTile<String>(
            title: Text(AppLocalizations.of(context)!.languagePortuguese),
            value: 'pt',
            groupValue: currentLocale?.languageCode,
            onChanged: (value) {
              if (value != null) {
                AppController.instance.setLocale(const Locale('pt'));
                Navigator.of(context).pop(true);
              }
            },
            activeColor: Theme.of(context).colorScheme.primary,
          ),
          RadioListTile<String>(
            title: Text(AppLocalizations.of(context)!.languageEnglish),
            value: 'en',
            groupValue: currentLocale?.languageCode,
            onChanged: (value) {
              if (value != null) {
                AppController.instance.setLocale(const Locale('en'));
                Navigator.of(context).pop(true);
              }
            },
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
