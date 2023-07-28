import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Future<void> createDialogBuilder(BuildContext context, List data) {
  final qrNameController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          backgroundColor: Colors.white60,
          title: const Text(
            'Add New QR',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  style: const TextStyle(color: Colors.black87),
                  textCapitalization: TextCapitalization.words,
                  controller: qrNameController,
                  cursorColor: Colors.black87,
                  cursorHeight: 22,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                      ),
                    ),
                    labelText: 'Application Name',
                    labelStyle: TextStyle(color: Colors.black87),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            TextButton(
              onPressed: () {
                if (qrNameController.text != '') {
                  data.add([qrNameController.text]);
                  final qrBox = Hive.box('qr');
                  qrBox.put('qr', data);
                  Navigator.pushReplacementNamed(context, '/');
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      );
    },
  );
}
