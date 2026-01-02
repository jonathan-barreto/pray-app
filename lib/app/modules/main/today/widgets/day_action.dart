import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DayAction extends StatelessWidget {
  final String label;
  final bool completed;
  final bool highlighted;

  const DayAction({
    super.key,
    required this.label,
    this.completed = false,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final Color backgroundColor = completed || highlighted
        ? colorScheme.primaryContainer
        : colorScheme.surfaceContainerHighest;

    final Color borderColor = completed || highlighted
        ? Colors.transparent
        : colorScheme.onPrimary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: borderColor,
              width: highlighted ? 0 : 1.5,
            ),
          ),
          child: completed
              ? Center(
                child: FaIcon(
                    FontAwesomeIcons.fire,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              )
              : Center(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: highlighted || completed
                          ? FontWeight.w700
                          : FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
