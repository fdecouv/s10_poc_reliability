import 'package:flutter/material.dart';
import 'package:reliabilityverification/screens/app_bar.dart';
import 'package:reliabilityverification/screens/doctor_verification.dart';
import 'package:reliabilityverification/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:reliabilityverification/screens/user_declarations.dart';

class ChoicesView extends StatefulWidget {
  @override
  _ChoicesViewState createState() => _ChoicesViewState();
}

class _ChoicesViewState extends State<ChoicesView>{

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
                    child: Text("Je suis médecin"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DoctorScan())
                        );
                      },
                  ),
                  RaisedButton(
                    child: Text("Je suis utilisateur"),
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserDeclarationView())
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