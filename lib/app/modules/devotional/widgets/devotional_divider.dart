import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class DevotionalDivider extends StatelessWidget {
  const DevotionalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 60,
      color: AppColors.outlineVariant,
    );
  }
}
