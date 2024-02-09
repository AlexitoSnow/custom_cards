part of '../custom_cards.dart';

InputDecoration _textFieldDecoration(String? description,
        {Widget? actionIcon, String? helperText}) =>
    InputDecoration(
        hintText: description,
        helperText: helperText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: actionIcon);
