import 'package:flutter/material.dart';
import 'package:reliability_verification/screens/app_bar.dart';
import 'package:reliability_verification/screens/symptom.dart';

class UserDeclarationView extends StatefulWidget {
  @override
  _UserDeclarationViewState createState() => _UserDeclarationViewState();
}

class _UserDeclarationViewState extends State<UserDeclarationView>{
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
                    child: Text("Je suis infecté (j'ai le résultat d'un test)"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SymptomView())
                        );
                      },
                  ),
                  RaisedButton(
                    child: Text("Je pense être infecté (mais je n'ai pas de test)"),
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SymptomView())
                        );
                      },
                  ),
                ],
              ),  
            )
        )
    );
  }
}