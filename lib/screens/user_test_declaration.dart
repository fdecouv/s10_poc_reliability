import 'package:flutter/material.dart';
import 'package:reliabilityverification/screens/app_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:reliabilityverification/screens/vision_text.dart';

class UserTestView extends StatefulWidget {
  @override
  _UserTestViewState createState() => _UserTestViewState();
}

class _UserTestViewState extends State<UserTestView>{
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
    return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: MyAppBar(),
    body: 
    SingleChildScrollView(
    child: Container(
            alignment: Alignment.center,
              child: Column(             
                  children: <Widget>[
                  Text(
                      "Vérification du Test\nEntrez son n° de série"
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
                        });
                    },
                  ),
                  _visibility ? new 
                  Container(
                    child: Column(
                    children: <Widget> [
                      Center(
                        child: FAProgressBar(
                          progressColor: Colors.blueAccent,
                          animatedDuration: const Duration(milliseconds: 1000),
                          currentValue: 100,
                          displayText: '%',
                      ),
                    ),
                    RaisedButton(
                    child: Text("Upload le résultat"),
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VisionTextWidget())
                        );
                    },
                  ),
                  ], 
                  ),
                  ) : new Container(),
                ],
              ),  
        ),
    ),
    );
  }
}