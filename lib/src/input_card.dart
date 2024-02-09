part of '../custom_cards.dart';

/// A card widget that displays an input field.
///
/// [multiline] is used to determine the [maxLength] of the [TextFormField].
///
/// See [RawCustomCard] for more info.
class InputCard extends RawCustomCard {
  final bool multiline;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;

  const InputCard({
    super.key,
    required super.title,
    this.maxLength,
    this.multiline = false,
    this.controller,
    super.trailing = Icons.keyboard_outlined,
    super.description,
    super.color,
    super.elevation,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return RawCustomCard(
      color: color,
      elevation: elevation,
      title: title,
      trailing: trailing,
      description: description,
      content: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: maxLength,
        validator: validator,
        controller: controller,
        decoration: _textFieldDecoration(description),
        maxLines: multiline ? 8 : 1,
        keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
      ),
    );
  }
}
