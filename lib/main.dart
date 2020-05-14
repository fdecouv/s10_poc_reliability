import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reliability_verification/screens/home.dart';
import 'package:reliability_verification/models/user_model.dart';


void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<User>(
    create: (context) => User(),  
    child: MaterialApp(
      title: 'Reliabilty_scoring',
      initialRoute: '/',
      routes: {
          '/': (context) => ChoicesView(),
        //  '/myCart': (context) => ShopCart(),
        },
      ),
    );
  }
}