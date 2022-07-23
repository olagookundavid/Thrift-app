import 'package:flutter/material.dart';

SnackBar showSnackBar(String text) => SnackBar(
      duration: const Duration(milliseconds: 700),
      content: Text(text),
    );
