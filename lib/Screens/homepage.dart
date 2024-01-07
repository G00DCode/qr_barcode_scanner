import 'dart:html';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result="Hey there!";
  String _scanBarcodeString="UNKNOWN";

  @override
  void initState(){
    super.initState();
  }

  Future scanQR()async{
    try{

      String qrResult=await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
      setState(() {
        result=qrResult;


      });
    }on PlatformException  catch(ex){
      result="Failed to get platform version";
    }
    if(!mounted)return;
    setState(() {
      _scanBarcodeString = result;
    });


  }
  Future scanBarcode()async{
    try{

      String qrResult=await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.BARCODE);
      setState(() {
        result=qrResult;


      });
    }on PlatformException  catch(ex){
      result="Failed to get platform version";
    }
    if(!mounted)return;
    setState(() {
      _scanBarcodeString = result;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Text(result,style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton.extended(icon: Icon(Icons.qr_code_2),
          label: Text("Scan QR Code"),
          onPressed: scanQR,),
          FloatingActionButton.extended(icon: Icon(Icons.bar_chart),
            label: Text("Scan Barcode"),
            onPressed: scanBarcode,),

        ],
      ),
    );
  }
}
