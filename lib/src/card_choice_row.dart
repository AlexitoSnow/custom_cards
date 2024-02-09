part of '../custom_cards.dart';

/// A card widget that displays a list of [FilterChip]
/// with the given [items]
///
/// See [RawCustomCard] for more info.
class CardChoiceRow extends StatefulWidget {
  final Map<String, bool> items;
  final String title;
  final IconData? trailing;
  final String? description;
  final bool validate;
  final double? elevation;
  final Color? color;

  const CardChoiceRow({
    required this.items,
    super.key,
    this.validate = false,
    required this.title,
    this.trailing = Icons.list_alt_outlined,
    this.description,
    this.elevation,
    this.color,
  });

  @override
  State<CardChoiceRow> createState() => _CardChoiceRowState();
}

class _CardChoiceRowState extends State<CardChoiceRow> {
  final scrollController = ScrollController();
  bool isValid = true;

  void validateItems() {
    if (!widget.items.containsValue(true)) {
      setState(() {
        isValid = false;
      });
    } else {
      setState(() {
        isValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawCustomCard(
      color: widget.color,
      elevation: widget.elevation,
      title: widget.title,
      trailing: widget.trailing,
      description: widget.description,
      content: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: true,
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
                overscroll: true,
              ),
              child: Scrollbar(
                scrollbarOrientation: ScrollbarOrientation.bottom,
                controller: scrollController,
                child: ListView(
                  controller: scrollController,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    widget.items.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FilterChip(
                          selected: widget.items.values.elementAt(index),
                          label: Text(widget.items.keys.elementAt(index)),
                          onSelected: (isSelected) {
                            setState(() {
                              widget.items.update(
                                  widget.items.keys.elementAt(index),
                                  (value) => isSelected);
                              if (widget.validate) validateItems();
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          if (!isValid)
            const Text(
              'At least one item must be selected',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
