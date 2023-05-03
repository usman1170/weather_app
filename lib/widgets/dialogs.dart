import 'package:flutter/material.dart';

class Dialogs {
  static void showMassage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.blue.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void circularIndicator(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (_) => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ));
  }

  static void errorDialog(
    BuildContext context,
    String title,
    String massage,
  ) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(title),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 20,
              bottom: 12,
            ),
            child: Text(
              massage,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }
}
