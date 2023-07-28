import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qr_generator/deleteqr.dart';
import 'package:qr_generator/qrdata.dart';
import 'addqr.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final qrBox = Hive.box('qr');
  QrDB db = QrDB();

  @override
  void initState() {
    super.initState();
    if (qrBox.get('qr') == null) {
      db.createData();
    } else {
      db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1b1d),
      appBar: AppBar(
        title: const Text(
          'QR Generator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff1b1b1d),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => createDialogBuilder(context, db.data),
            icon: const Icon(
              Icons.add,
              color: Colors.white60,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 90,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                itemCount: db.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onLongPress: () => deleteDialogBuilder(
                        context, db.data[index][0], index, db.data),
                    onTap: () => Navigator.pushNamed(context, '/qrdisplay',
                        arguments: {'qrName': db.data[index][0]}),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white60,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: Colors.white60,
                      ),
                      child: Center(
                        child: Text(
                          db.data[index][0],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
