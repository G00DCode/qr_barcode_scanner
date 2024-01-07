import 'package:flutter/material.dart';
import 'package:qr_barcode_scanner/Screens/homepage.dart';


void main(){
  runApp(QRScannerApp());
}
class QRScannerApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

}