import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Notifier.dart';

class Register extends StatelessWidget {
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
                return null;
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
                return null;
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
                      child: Text('REGISTRARTE'),
                    );
                  },
                )),
          ],
        ),
      )),
    );
  }
}

void format(UserData userdata, String mail, String password) {
  userdata.cambiarValor(mail, password, true);
}
