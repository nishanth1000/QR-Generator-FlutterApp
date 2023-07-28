import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrDisplay extends StatelessWidget {
  const QrDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrdata = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: const Color(0xff1b1b1d),
      appBar: AppBar(
        backgroundColor: const Color(0xff1b1b1d),
        title: Text(
          qrdata['qrName'],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
              color: Colors.white60,
            )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white60,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white60,
              ),
              child: QrImageView(data: qrdata['qrName'])),
        ),
      ),
    );
  }
}
