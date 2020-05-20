import 'package:flutter/material.dart';
import 'package:reliabilityverification/screens/app_bar.dart';
import 'package:reliabilityverification/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:reliabilityverification/screens/qr_code.dart';

class DoctorView extends StatefulWidget {
  @override
  _DoctorViewState createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Résultat du test",
              style: TextStyle(
                fontSize: 24,
              ),
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
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text("Générer QR code"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QRCodeView()));
            },
          ),
        ],
      ),
    );
  }
}
