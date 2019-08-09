import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hello_world/app_store/chat_provider.dart';
import 'package:hello_world/main.dart';
import 'package:hello_world/models/user.dart';
import 'package:http/http.dart';

class AppState with ChangeNotifier  {
  AuthUserDetails _userLoginDetails;
  bool _userLogedIn = false;

  AuthUserDetails getUserLoginDetails() => _userLoginDetails;
  setUserLoginDetails(AuthUserDetails loginDetails) {
    _userLoginDetails = loginDetails;
    notifyListeners();
  }

  void login(String password, String username) async {
    var response = await post("$kHostUrl/api/accounts/login",
        headers: {"Content-Type": "application/json"},
        body: json.encode({'username': username, 'password': password}));
        print("<<<<<<"+response.statusCode.toString());
    _userLoginDetails = AuthUserDetails.fromJson(jsonDecode(response.body));
    _userLogedIn = true;
    notifyListeners();
  }

  void logout() {
    _userLogedIn = false;
    print("<<<<<< Users logged out");
    notifyListeners();
  }

  bool getisUserLogedIn() {
    return _userLogedIn;
  }

}
