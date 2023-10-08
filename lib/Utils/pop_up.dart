import 'package:flutter/material.dart';

Future<void> popUp(
    {required BuildContext context, required String string, String? title}) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: title != null ? Text(title) : null,
          content: Text(string),
          actions: [
            TextButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[800],
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}
