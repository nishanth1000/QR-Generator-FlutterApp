import 'package:flutter/material.dart';
import 'package:qr_generator/qr.dart';
import 'home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('qr');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Generator',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Home(),
        '/qrdisplay': (context) => const QrDisplay(),
      },
    );
  }
}
