import 'package:flutter/material.dart';
import 'package:reliabilityverification/screens/app_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:reliabilityverification/screens/vision_text.dart';
import 'package:reliabilityverification/models/user_model.dart';
import 'package:reliabilityverification/screens/home.dart';
import 'package:provider/provider.dart';

class UserTestView extends StatefulWidget {
  @override
  _UserTestViewState createState() => _UserTestViewState();
}

class _UserTestViewState extends State<UserTestView> {
  final _text = TextEditingController();
  bool _visibility = false;
  bool _validate = false;

  void _changed() {
    setState(() {
      _visibility = true;
      _validate = false;
    });
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    showAlertDialog(BuildContext context, String title, String text) {
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChoicesView()));
        },
      );

      AlertDialog alert = AlertDialog(
        title: Text(title),
        content: Text(text),
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
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                "Vérification du Test\nEntrez son n° de série",
                style: TextStyle(
                  height: 2,
                  fontSize: 15,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _text,
                decoration: InputDecoration(
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "N° de série",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.7),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(15.7),
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Valider"),
                onPressed: () {
                  setState(() {
                    _text.text.isEmpty ? _validate = true : _changed();
                    FocusScope.of(context).unfocus();
                    _text.clear();
                  });
                },
              ),
              _visibility
                  ? new Container(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: FAProgressBar(
                              progressColor: Colors.blueAccent,
                              animatedDuration:
                                  const Duration(milliseconds: 1000),
                              currentValue: 100,
                              displayText: '%',
                            ),
                          ),
                          Text(
                            "Quel est le résultat de ce test ?",
                            style: TextStyle(
                              height: 2,
                              fontSize: 25,
                            ),
                          ),
                          CheckboxListTile(
                            title: const Text('Positif'),
                            value: user.checkBoxValue,
                            onChanged: (bool value) {
                              setState(() {
                                if (value) {
                                  user.setCheckBoxValue(true);
                                } else {
                                  user.setCheckBoxValue(false);
                                }
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: const Text('Négatif'),
                            value: !user.checkBoxValue,
                            onChanged: (bool value) {
                              setState(() {
                                if (value) {
                                  user.setCheckBoxValue(false);
                                } else {
                                  user.setCheckBoxValue(true);
                                }
                              });
                            },
                          ),
                          RaisedButton(
                            child: Text("Valider"),
                            onPressed: () {
                              showAlertDialog(context, "Merci",
                                  "Votre signalement a bien été pris en compte");
                              user.setReliabilityScore(75);
                            },
                          ),
                          Text(
                            "Vous pouvez donner plus d'importance a votre signalement en vérifier votre résultat",
                            style: TextStyle(
                              height: 2,
                              fontSize: 15,
                            ),
                          ),
                          RaisedButton(
                            child: Text("Je vérifie mon résultat"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VisionTextWidget()));
                            },
                          ),
                        ],
                      ),
                    )
                  : new Container(),
            ],
          ),
        ),
      ),
    );
  }
}
