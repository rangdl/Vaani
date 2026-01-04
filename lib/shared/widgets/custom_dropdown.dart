// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:vaani/constants/sizes.dart';

// 自定义下拉选择
class CustomDropdown<T> extends StatelessWidget {
  final T? selected;

  final FutureOr<List<T>> Function(String, LoadProps?)? items;
  final String Function(T)? itemAsString;
  final void Function(T?)? onChanged;
  const CustomDropdown({
    super.key,
    this.selected,
    this.items,
    this.onChanged,
    this.itemAsString,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      selectedItem: selected,
      mode: Mode.custom,
      items: items,
      dropdownBuilder: (ctx, selectedItem) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(_itemAsString(selectedItem)),
            const Icon(Icons.keyboard_arrow_down),
          ],
        );
      },
      popupProps: PopupProps.menu(
        menuProps: MenuProps(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppElementSizes.borderRadiusRegular),
          ),
          popUpAnimationStyle: AnimationStyle(duration: Duration.zero),
        ),
        constraints: const BoxConstraints(minWidth: 180),
        itemBuilder: (context, item, isDisabled, isSelected) => ListTile(
          title: Text(_itemAsString(item)),
          trailing: selected == item ? Icon(Icons.check) : null,
        ),
        fit: FlexFit.loose,
      ),
      onChanged: onChanged,
    );
  }

  String _itemAsString(T? data) {
    if (data == null) {
      return "";
    } else if (itemAsString != null) {
      return itemAsString!(data);
    }

    return data.toString();
  }
}
