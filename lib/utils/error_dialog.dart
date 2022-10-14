import 'package:flutter/material.dart';

Future<void> showErrorDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String defaultActionText,
}) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red),
      ),
      content: Text(content, textAlign: TextAlign.center),
      actions: <Widget>[
        TextButton(
          child: Text(defaultActionText),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
