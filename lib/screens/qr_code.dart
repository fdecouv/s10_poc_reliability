import 'package:flutter/material.dart';
import 'package:reliabilityverification/models/user_model.dart';
import 'package:reliabilityverification/screens/app_bar.dart';
import 'package:provider/provider.dart';

class QRCodeView extends StatefulWidget {
  @override
  _QRCodeViewState createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView>{
  @override
  Widget build(BuildContext context){
        var user = Provider.of<User>(context);

        showAlertDialog(BuildContext context) {
          Widget okButton = FlatButton(
            child: Text("OK"),
            onPressed: () {
                Navigator.pop(context); 
              },
          );

          AlertDialog alert = AlertDialog(
            title: Text("Merci"),
            content: Text("Votre signalement a bien été pris en compte !"),
            actions: [
              okButton,
            ],
          );

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
    }
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/qr_code.jpg"),
              ),
            ),
            child: Column(
              children: <Widget>[
                RaisedButton(
                    child: Text("L'utilisateur scan le QRCode"),
                      onPressed: () {
                        if(user.hasClicked == true){
                          showAlertDialog(context);
                        }else{
                          user.setReliabilityScore(100);
                          user.setHasClicked(true);
                          showAlertDialog(context);
                        }
                        
                      },
                  ),
              ],
          ),
        ),
    );
  }
}

class ValidationAlert extends StatelessWidget{
  @override
  Widget build(BuildContext context){

  }
}