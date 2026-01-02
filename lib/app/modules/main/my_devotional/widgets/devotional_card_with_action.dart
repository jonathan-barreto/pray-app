import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/devotional_card.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';

class DevotionalCardWithAction extends StatelessWidget {
  final DevotionalEntity devotional;
  final VoidCallback? onAccessPressed;

  const DevotionalCardWithAction({
    super.key,
    required this.devotional,
    this.onAccessPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DevotionalCard(
          devotional: devotional,
          onAccessPressed: onAccessPressed,
          showFavorite: false,
          showLabel: false,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoutes.privateDevotionalsName);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.primary,
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Ver Histórico',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
