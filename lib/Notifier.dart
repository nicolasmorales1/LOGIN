import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  /// Internal, private state of the cart.
  String correo;
  String clave;
  bool loggedVerif;
  UserData({this.correo, this.clave, this.loggedVerif});

  void cambiarValor(String email, String passw, bool log) {
    correo = email;
    clave = passw;
    loggedVerif = log;
    notifyListeners();
  }
}
