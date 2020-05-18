import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reliabilityverification/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:reliabilityverification/screens/app_bar.dart';
import 'package:reliabilityverification/screens/home.dart';

class SymptomView extends StatefulWidget {
  @override
  _SymptomViewState createState() => _SymptomViewState();
}

class _SymptomViewState extends State<SymptomView>{
  @override
  Widget build(BuildContext context){
    var user = Provider.of<User>(context);

    showAlertDialog(BuildContext context) {

        Widget okButton = FlatButton(
          child: Text("OK"),
          onPressed: () {Navigator.pop(context); },
        );

        AlertDialog alert = AlertDialog(
          title: Text("Oups"),
          content: Text("Vous vous êtes déjà déclaré infecté."),
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
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage("assets/images/symptoms.png"),
          ),
        ),
        child:  Container(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.3,
                child: Column(             
                  children: <Widget>[
                  RaisedButton(
                    child: Text("Oui j'atteste avoir au moins un de ces symptômes"),
                      onPressed: () {
                        if(user.hasClicked == true){
                          showAlertDialog(context);
                        }else{
                          user.setReliabilityScore(50);
                          user.setHasClicked(true);
                        }
                      },
                  ),
                  RaisedButton(
                    child: Text("Non, je ne pense pas"),
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChoicesView())
                        );
                      },
                  ),
                ],
              ),  
            ),
      ),
      ),
    );
  }
}