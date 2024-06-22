import 'package:flutter/material.dart';

Widget DropDown(List<String> items, String value, onChange(val)) {
  String? effectiveValue =
      items.contains(value) ? value : (items.isNotEmpty ? items.first : null);
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white70,
      borderRadius: BorderRadius.circular(10),
    ),
    child: DropdownButton<String>(
      value: effectiveValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 0,
      style: const TextStyle(color: Colors.black),
      onChanged: (String? val) {
        onChange(val);
      },
      items: items.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Text(val),
        );
      }).toList(),
    ),
  );
}
