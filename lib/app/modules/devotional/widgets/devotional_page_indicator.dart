import 'package:flutter/material.dart';

class DevotionalPageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final Function(int) onPageTap;

  const DevotionalPageIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.onPageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => GestureDetector(
          onTap: () => onPageTap(index),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentPage
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
        ),
      ),
    );
  }
}
