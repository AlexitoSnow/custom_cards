part of '../custom_cards.dart';

/// A card widget that displays a date picker.
///
/// The selected date is displayed in the [TextFormField] and
/// formatted using the [formatter].
///
/// See [RawCustomCard] for more info.
class DatedCard extends RawCustomCard {
  final TextEditingController controller;
  final DateFormat formatter;
  final Function(String date) onDatePicked;
  final bool readOnly;

  DatedCard({
    super.key,
    required super.title,
    IconData super.trailing = Icons.date_range_outlined,
    super.description,
    required this.controller,
    DateFormat? formatter,
    required this.onDatePicked,
    this.readOnly = true,
    super.color,
    super.elevation,
  }) : formatter = formatter ?? DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return RawCustomCard(
      color: color,
      elevation: elevation,
      title: title,
      trailing: trailing,
      description: description,
      content: TextField(
        readOnly: readOnly,
        controller: controller,
        decoration: _textFieldDecoration(
          description,
          actionIcon: IconButton(
            icon: Icon(trailing),
            onPressed: () async {
              DateTime? datePicked = (await showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                currentDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime.now(),
                initialDate: controller.text.isNotEmpty
                    ? formatter.parse(controller.text)
                    : DateTime.now(),
              ));
              controller.text = datePicked != null
                  ? formatter.format(datePicked)
                  : controller.text;
              onDatePicked(datePicked != null
                  ? formatter.format(datePicked)
                  : controller.text);
            },
          ),
        ),
      ),
    );
  }
}
