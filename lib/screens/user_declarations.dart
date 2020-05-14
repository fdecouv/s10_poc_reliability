import 'package:flutter/material.dart';
import 'package:reliability_verification/main.dart';
import 'package:reliability_verification/screens/app_bar.dart';
import 'package:reliability_verification/screens/doctor_verification.dart';
import 'package:reliability_verification/models/user_model.dart';
import 'package:provider/provider.dart';

class UserDeclarationView extends StatefulWidget {
  @override
  _UserDeclarationViewState createState() => _UserDeclarationViewState();
}

class _UserDeclarationViewState extends State<UserDeclarationView>{
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
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
                          MaterialPageRoute(builder: (context) => Home())
                        );
                      },
                  ),
                  RaisedButton(
                    child: Text("Je pense être infecté (mais je n'ai pas de test)"),
                    onPressed: () => user.setReliabilityScore(50),
                  ),
                ],
              ),  
            )
        )
    );
  }
}