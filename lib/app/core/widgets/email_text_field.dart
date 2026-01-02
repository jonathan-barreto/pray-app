import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final String? initialValue;
  final bool enabled;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final Iterable<String>? autofillHints;
  final InputDecoration? decoration;

  const EmailTextField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.initialValue,
    this.enabled = true,
    this.textInputAction,
    this.onEditingComplete,
    this.autofillHints = const [AutofillHints.email],
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveDecoration = (decoration ?? const InputDecoration()).copyWith(
      labelText: decoration?.labelText ?? 'E-mail',
      prefixIcon: decoration?.prefixIcon ??
          Icon(
            Icons.email_outlined,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 22,
          ),
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: 2,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    );

    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      enabled: enabled,
      initialValue: controller == null ? initialValue : null,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      autofillHints: autofillHints,
      keyboardType: TextInputType.emailAddress,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
      decoration: effectiveDecoration,
    );
  }
}
