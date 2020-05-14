import 'package:flutter/material.dart';
import 'package:reliability_verification/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:reliability_verification/screens/app_bar.dart';
import 'package:reliability_verification/screens/home.dart';

class SymptomView extends StatefulWidget {
  @override
  _SymptomViewState createState() => _SymptomViewState();
}

class _SymptomViewState extends State<SymptomView>{
  @override
  Widget build(BuildContext context){
    var user = Provider.of<User>(context);
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
                        user.setReliabilityScore(50);
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