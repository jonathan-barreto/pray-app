import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class DevotionalIconCircle extends StatelessWidget {
  final IconData icon;

  const DevotionalIconCircle({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 40,
        color: AppColors.primary,
      ),
    );
  }
}
