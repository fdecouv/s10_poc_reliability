import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:reliability_verification/models/user_model.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return new Size.fromHeight(59.0);
  }
  @override
  Widget build(BuildContext context) {
  var user = Provider.of<User>(context);
  return AppBar(
        title: Text('Reliabilty_scoring'),
        actions: <Widget>[
          new Padding(padding: const EdgeInsets.all(20.0),
          child: Text("Your score: "+user.reliabilityScore.toString()),
          ),
        ],
      );
  }
}