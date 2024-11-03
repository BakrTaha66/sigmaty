import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownMultiApp extends StatelessWidget {
  const CustomDropdownMultiApp(
      {
        super.key,
        required this.items,
        required this.selectedItems,
        required this.hintText,
        required this.onChanged,
      });
  final List<String> items;
  final List<String> selectedItems;
  final String hintText;
  final Function(List<String>) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
      popupProps: PopupPropsMultiSelection.menu(
        showSelectedItems: true,
        showSearchBox: true,
      ),
      items: items,
      selectedItems: selectedItems,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
      onChanged: onChanged,

    );
  }
}
