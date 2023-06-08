import 'package:country/utils/extensions.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.margin,
    this.onClearText,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onClearText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            color: context.theme.hintColor,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: context.theme.hintColor,
            ),
            onPressed: () {
              controller?.clear();
              onClearText?.call();
            },
          ),
        ),
      ),
    );
  }
}
