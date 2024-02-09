part of '../custom_cards.dart';

/// A simple Info Card widget that displays a [title] and [subtitle].
///
/// See [RawCustomCard] for more info.
class TitledCard extends RawCustomCard {
  const TitledCard({
    super.key,
    required super.title,
    super.subtitle,
    super.trailing = Icons.info_outlined,
    super.description,
    super.color,
    super.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return RawCustomCard(
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      description: description,
      color: color,
      elevation: elevation,
    );
  }
}
