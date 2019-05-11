import 'package:flutter/material.dart';

// const InputDecoration inputField = const InputDecoration();
InputDecoration inputField(String hintText, String labelText) {
  return InputDecoration(
      hintText: hintText, labelText: labelText, border: OutlineInputBorder());
}
