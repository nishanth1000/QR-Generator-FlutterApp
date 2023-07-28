import 'package:hive/hive.dart';

class QrDB {
  List data = [];

  final qrBox = Hive.box('qr');

  void createData() {
    data = [
      ['dummyQR']
    ];
  }

  void loadData() {
    data = qrBox.get('qr');
  }

  void updateData() {
    qrBox.put('qr', data);
  }
}
