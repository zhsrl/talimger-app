import 'package:flutter/material.dart';

showAppSnackBar({
  String? text,
  @required BuildContext? context,
}) {
  SnackBar snackBar = SnackBar(content: Text(text ?? ''));

  return ScaffoldMessenger.of(context!).showSnackBar(snackBar);
}
