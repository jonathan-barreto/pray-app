import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/core/widgets/app_text_field.dart';

class GenerateMyDevotionalSection extends StatelessWidget {
  final TextEditingController controller;
  final int maxCharacters;
  final VoidCallback onGeneratePressed;
  final bool isLoading;

  const GenerateMyDevotionalSection({
    super.key,
    required this.controller,
    required this.maxCharacters,
    required this.onGeneratePressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, color: AppColors.primary, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Devocional Personalizado',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Como você está se sentindo hoje?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: controller,
            hintText: 'Ex: Estou ansioso com o trabalho...',
            maxLength: maxCharacters,
            maxLines: 3,
            enabled: !isLoading,
          ),
          const SizedBox(height: 16),
          AppButton(
            label: 'Gerar Devocional',
            onPressed: onGeneratePressed,
            icon: const Icon(Icons.auto_awesome, size: 18),
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
