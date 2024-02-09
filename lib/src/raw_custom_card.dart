part of '../custom_cards.dart';

/// Displays a Custom Info Card Widget
///
/// [subtitle] and [content] are mutually exclusive.
///
/// [description] is the tooltip message for the [trailing] icon. (optional)
class RawCustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? trailing;
  final String? description;
  final Widget? content;
  final double? elevation;
  final Color? color;

  const RawCustomCard({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing = Icons.info_outlined,
    this.description,
    this.content,
    this.elevation,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    assert(
      (subtitle != null && content == null) ||
          (subtitle == null && content != null),
      'Either subtitle or content should be provided, but not both.',
    );
    return Card(
      color: color,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            title,
            style: _titleStyle,
          ),
          trailing: description != null
              ? Tooltip(
                  message: description,
                  child: Icon(trailing),
                )
              : Icon(trailing ?? Icons.info_outlined),
          subtitle: subtitle != null ? Text(subtitle!) : content,
        ),
      ),
    );
  }
}

/// The default style for the [title] of the [RawCustomCard].
const _titleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
