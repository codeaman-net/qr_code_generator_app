import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey globalKey = GlobalKey();
  String qrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: qrData.isNotEmpty
                      ? QrImageView(
                          data: qrData,
                          version: QrVersions.auto,
                          size: 200,
                        )
                      : const Text(
                          "Enter Data to Generate QR Code",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Enter data",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    qrData = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
