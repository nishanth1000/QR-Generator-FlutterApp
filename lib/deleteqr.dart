import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Future<void> deleteDialogBuilder(
    BuildContext context, String qrName, var index, List data) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          backgroundColor: Colors.white60,
          title: Text(
            qrName,
            style: const TextStyle(color: Colors.black87, fontSize: 20),
          ),
          content: const Text(
            'Do you want to delete this QR Code ?',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                data.removeAt(index);
                final qrBox = Hive.box('qr');
                qrBox.put('qr', data);
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      );
    },
  );
}
