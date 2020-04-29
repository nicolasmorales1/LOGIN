import 'package:flutter/material.dart';
import 'package:login/Home.dart';
import 'package:provider/provider.dart';

import 'Notifier.dart';
import 'Registro.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: mailController,
              decoration: const InputDecoration(
                hintText: 'CORREO',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'INGRESA UN CORREO VALIDO';
                }
                if (mailController.text == "a@a.com") {
                  return null;
                }
                return "CORREO NO REGISTRADO";
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'CLAVE',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'INGRESA UNA CLAVE VALIDA';
                }
                if (passwordController.text == "12345") {
                  return null;
                }
                return "CLAVE INCORRECTA";
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Consumer<UserData>(
                  builder: (context, userdata, child) {
                    return RaisedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState.validate()) {
                          format(userdata, mailController.text,
                              passwordController.text);
                        }
                      },
                      child: Text('LOGIN'),
                    );
                  },
                )),
            GestureDetector(
              child: Text("REGISTRATE"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
            )
          ],
        ),
      )),
    );
  }
}

void format(UserData userdata, String mail, String password) {
  userdata.cambiarValor(mail, password, true);
}
