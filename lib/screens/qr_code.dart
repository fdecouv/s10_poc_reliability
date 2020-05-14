import 'package:flutter/material.dart';

class QRCodeView extends StatefulWidget {
  @override
  _QRCodeViewState createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/qr_code.jpg"),
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}