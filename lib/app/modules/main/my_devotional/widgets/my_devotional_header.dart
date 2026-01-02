import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class MyDevotionalHeader extends StatelessWidget {
  const MyDevotionalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Crie devocionais personalizados e acompanhe sua jornada espiritual.',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.textSecondary,
        fontSize: 16,
        height: 1.6,
      ),
    );
  }
}
