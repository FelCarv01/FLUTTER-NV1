import 'package:flutter/material.dart';
import 'package:projeto01/services/prefs_service.dart';

class LoginController {
  ValueNotifier<bool> inloader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> auth() async {
    inloader.value = true;
    await Future.delayed(const Duration(seconds: 1));
    inloader.value = false;
    if (_login == 'admin' && _pass == '123') {
      PrefsService.save(_login!);
      return true;
    }
    return false;
  }
}
