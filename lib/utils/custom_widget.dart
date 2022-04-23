import 'package:flutter/material.dart';

import 'constants.dart';

class CustomWidgets {
  CustomWidgets._();
  static buildSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: kColorPrimaryDark,
          content: Text(message),
        ),
      );
  }
}