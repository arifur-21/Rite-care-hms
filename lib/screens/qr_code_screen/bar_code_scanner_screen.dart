/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarCodeScannerScreen extends StatefulWidget {
  const BarCodeScannerScreen({required Key key}) : super(key: key);

  @override
  State<BarCodeScannerScreen> createState() => _BarCodeScannerScreenState();
}

class _BarCodeScannerScreenState extends State<BarCodeScannerScreen> {

  var getResult = 'Bar Code Scanner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Code Scanner'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  scanQRCode();
                },
                child: Text('Bar Code Scanner'),
              ),
              SizedBox(height: 20.0,),
              Text(getResult),
            ],
          )
      ),
    );
  }

  void scanQRCode() async {
    try{
      final brCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);

      if (!mounted) return;

      setState(() {
        getResult = brCode;
      });
      print("QRCode_Result:--");
      print(brCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }

  }

}*/
