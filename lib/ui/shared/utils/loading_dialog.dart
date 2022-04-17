import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

loadingAlertDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            Container(
                margin: const EdgeInsets.only(left: 5),
                child: const Text('loading')),
          ],
        ),
      );
    },
  );
}
