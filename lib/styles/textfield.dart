import 'package:flutter/material.dart';

// const InputDecoration inputField = const InputDecoration();
InputDecoration inputField(
    String hintText, String labelText, String errorText) {
  return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      border: OutlineInputBorder(),
      errorText: errorText);
}
