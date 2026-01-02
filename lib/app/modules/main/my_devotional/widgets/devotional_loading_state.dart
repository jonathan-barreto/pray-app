import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class DevotionalLoadingState extends StatelessWidget {
  const DevotionalLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.08),
            blurRadius: 32,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmer(
                      width: 120,
                      height: 12,
                      borderRadius: 6,
                    ),
                    const SizedBox(height: 8),
                    _buildShimmer(
                      width: 140,
                      height: 16,
                      borderRadius: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              _buildShimmer(
                width: 48,
                height: 48,
                borderRadius: 24,
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildShimmer(
            width: double.infinity,
            height: 20,
            borderRadius: 8,
          ),
          const SizedBox(height: 8),
          _buildShimmer(
            width: 200,
            height: 20,
            borderRadius: 8,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildShimmer(
                width: 48,
                height: 48,
                borderRadius: 16,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmer(
                      width: 150,
                      height: 14,
                      borderRadius: 6,
                    ),
                    const SizedBox(height: 6),
                    _buildShimmer(
                      width: double.infinity,
                      height: 12,
                      borderRadius: 6,
                    ),
                    const SizedBox(height: 4),
                    _buildShimmer(
                      width: double.infinity,
                      height: 12,
                      borderRadius: 6,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildShimmer(
                  width: double.infinity,
                  height: 46,
                  borderRadius: 12,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildShimmer(
                  width: double.infinity,
                  height: 46,
                  borderRadius: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer({
    required double width,
    required double height,
    required double borderRadius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.textMuted.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
