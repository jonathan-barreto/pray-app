import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/core/utils/text_formatter.dart';
import 'package:pray_app/app/core/widgets/app_button.dart';
import 'package:pray_app/app/core/widgets/feature_in_development_dialog.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';

class DevotionalFourthPage extends StatefulWidget {
  final DevotionalEntity devotional;

  const DevotionalFourthPage({super.key, required this.devotional});

  @override
  State<DevotionalFourthPage> createState() => _DevotionalFourthPageState();
}

class _DevotionalFourthPageState extends State<DevotionalFourthPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.surface,
            AppColors.primaryContainer.withValues(alpha: 0.1),
          ],
          stops: const [0.6, 1.0],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _opacityAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer.withValues(
                          alpha: 0.4,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.volunteer_activism,
                        size: 32,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Text(
                'Oração',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (widget.devotional.prayer.isNotEmpty)
              FadeTransition(
                opacity: _opacityAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    TextFormatter.formatHtmlText(widget.devotional.prayer),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.8,
                      color: AppColors.textSecondary,
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            const SizedBox(height: 24),
            FadeTransition(
              opacity: CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
              ),
              child: SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: 'Compartilhar',
                  onPressed: () {
                    FeatureInDevelopmentDialog.show(
                      context,
                      featureName: 'Compartilhar',
                    );
                  },
                  expand: false,
                  icon: const Icon(Icons.share_outlined, size: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
