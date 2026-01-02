import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/core/utils/text_formatter.dart';

class DevotionalBodyText extends StatelessWidget {
  final String text;
  final bool isItalic;
  final TextAlign? textAlign;

  const DevotionalBodyText({
    super.key,
    required this.text,
    this.isItalic = false,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      TextFormatter.formatHtmlText(text),
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        height: 1.8,
        color: AppColors.textSecondary,
        fontSize: 17,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      ),
      textAlign: textAlign,
    );
  }
}
