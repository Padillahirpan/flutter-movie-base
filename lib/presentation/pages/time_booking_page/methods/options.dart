import 'package:flutter/widgets.dart';
import 'package:movie_app/presentation/misc/methods.dart';

import '../../../widgets/selectable_card.dart';

List<Widget> options<T>({
  required String title,
  required List<T> options,
  required T? selectedItem,
  String Function(T object)? converter,
  bool Function(T object)? isOptionEnable,
  required void Function(T object) onTap,
}) => [
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Text(
      title,
      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
  ),
  verticalSpace(12),
  SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: options.map((option) {
        final bool isSelected = option == selectedItem;
        final bool isEnabled = isOptionEnable?.call(option) ?? true;

        bool isFirst = options.first == option;
        return Padding(
          padding: EdgeInsets.only(
            left: isFirst ? 16.0 : 0.0,
            right: option == options.last ? 16.0 : 8.0,
          ),
          child: SelectableCard(
            text: converter?.call(option) ?? option.toString(),
            isSelected: isSelected,
            isEnabled: isEnabled,
            onTap: isEnabled ? () => onTap(option) : null,
          ),
        );
      }).toList(),
    ),
  ),
];
