import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownApp extends StatelessWidget {
  const CustomDropdownApp(
      {
        super.key,
        required this.items,
        required this.hintText,
        required this.onChanged,
      });
  final List<String> items;
  final String hintText;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    var selectedItem = null;

    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSelectedItems: true,
        showSearchBox: true,
      ),
      items: items,
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
      selectedItem: selectedItem,
    );
  }
}
