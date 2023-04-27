import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}
