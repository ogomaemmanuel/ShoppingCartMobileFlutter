import 'package:flutter/cupertino.dart';
import 'package:hello_world/models/user.dart';

class AppState with ChangeNotifier{
  AuthUserDetails _userLoginDetails;
  bool _userLogedIn=false;

  AuthUserDetails getUserLoginDetails()=>_userLoginDetails;
  setUserLoginDetails(AuthUserDetails loginDetails){
    _userLoginDetails=loginDetails;
    notifyListeners();
  }
  void login(String password,String username){
     _userLogedIn= true;
     print("<<<<<< password and username in appstate ${password} ${username}");
     notifyListeners();
  }
  void logout(){
     _userLogedIn= false;
     print("<<<<<< Users logged out");
     notifyListeners();
  }
  bool getisUserLogedIn(){
    return _userLogedIn;
  }
}