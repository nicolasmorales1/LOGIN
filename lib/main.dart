import 'package:flutter/material.dart';
import 'package:login/Notifier.dart';
import 'package:login/Login.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

void main() {
  runApp(ChangeNotifierProvider<UserData>(
      create: (context) => UserData(correo: "", clave: "", loggedVerif: false),
      child: MaterialApp(
          title: 'Login',
          home: Consumer<UserData>(
            builder: (context, userdata, child) {
              if (userdata.loggedVerif) {
                return Home();
              } else {
                return Login();
              }
            },
          ))));
}
