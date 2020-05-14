import 'package:flutter/material.dart';
import 'package:reliability_verification/screens/app_bar.dart';
import 'package:reliability_verification/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:reliability_verification/screens/qr_code.dart';

class DoctorView extends StatefulWidget {
  @override
  _DoctorViewState createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView>{
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Scaffold(
    appBar: MyAppBar(),
    body: Column(        
            children: <Widget>[
              Center(
                child:                        
                  Text("Résultat du test",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              CheckboxListTile(
                  title: const Text('Positif'),
                  value: user.boolValue,
                  onChanged: (bool value) {
                    setState(() {
                      if (value){
                        user.boolValue = true;
                      }else{
                        user.boolValue = false;
                      }
                    });
                  },
                ),
              CheckboxListTile(
                  title: const Text('Négatif'),
                  value: !user.boolValue,
                  onChanged: (bool value) {
                    setState(() {
                      if (value){
                        user.boolValue = false;
                      }else{
                        user.boolValue = true;
                      }
                    });
                  },
              // child: ListView(
              //   padding: EdgeInsets.only(left: 20, right: 20),
              //   children: <Widget>[
              //     Container(
              //       height: 50,
              //       color: Colors.redAccent,
              //       child: const Center(
              //       child: Text('Positif', style: TextStyle(color: Colors.black),
              //           ),
              //       ),
              //     ),
              //     Container(
              //       height: 50,
              //       color: Colors.greenAccent,
              //       child: const Center(
              //         child: Text('Négatif', style: TextStyle(color: Colors.black),
              //           ),
              //         ),
              //     ),
              //   ],
              // ),
             ),
            RaisedButton(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text("Générer QR code"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRCodeView())
                  );
                },
              ),
           ],
        ),
    );
  }
}