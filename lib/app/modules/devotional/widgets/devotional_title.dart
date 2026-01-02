import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class DevotionalTitle extends StatelessWidget {
  final String title;

  const DevotionalTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.3,
        fontSize: 32,
      ),
    );
  }
}
