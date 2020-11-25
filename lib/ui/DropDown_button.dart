import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {
  final List<Map<String, String>> items;
  final String value;
  final onChanged;

  DropDownButton(
      {@required this.items, @required this.value, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButton(
        items: items.map((Map i) => DropdownMenuItem(
            value: i["value"].toString(), child: Text(i["name"]))).toList(),
        value: value,
        onChanged: (String v) {
          onChanged(v);
        });
  }
}
