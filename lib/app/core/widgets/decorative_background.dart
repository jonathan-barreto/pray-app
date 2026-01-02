import 'package:flutter/material.dart';

class DecorativeBackground extends StatelessWidget {
  final double opacity;
  final int circleCount;

  const DecorativeBackground({
    super.key,
    this.opacity = 0.04,
    this.circleCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final circleColor = colorScheme.primary.withValues(alpha: opacity);

    return Stack(
      children: [
        Positioned(
          top: -80,
          right: -80,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor,
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: -100,
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor,
            ),
          ),
        ),
        if (circleCount >= 3)
          Positioned(
            bottom: 150,
            right: -90,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
              ),
            ),
          ),
        if (circleCount >= 4)
          Positioned(
            bottom: -60,
            left: 30,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
              ),
            ),
          ),
      ],
    );
  }
}
