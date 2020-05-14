import 'package:flutter/material.dart';
import 'package:reliability_verification/screens/app_bar.dart';
import 'package:reliability_verification/screens/qr_code_scanner.dart';

class ChoisesButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: MyAppBar(),
    body: Container(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              heightFactor: 0.3,
                child: Column(             
                  children: <Widget>[
                  RaisedButton(
                    child: Text("Je suis médecin"),
                    onPressed: () => null,
                  ),
                  RaisedButton(
                    child: Text("Je suis utilisateur"),
                    onPressed: () => null,
                  ),
                ],
              ),  
            )
        )
    );
  }
}