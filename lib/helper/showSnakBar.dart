import 'package:flutter/material.dart';

void showSnacBar(BuildContext context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(messege),
    ),
  );
}
