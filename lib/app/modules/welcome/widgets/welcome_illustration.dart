import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_assets.dart';

class WelcomeIllustration extends StatelessWidget {
  const WelcomeIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.person2,
        fit: BoxFit.contain,
        semanticLabel: 'Pessoa adorando',
      ),
    );
  }
}
