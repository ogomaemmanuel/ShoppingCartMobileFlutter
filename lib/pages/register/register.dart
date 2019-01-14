import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget{
  final formKey = new GlobalKey<FormState>();
  String username;
  String password;
  String confirmPassword;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  void _register(){

  }

  Widget _buildForm(){
    return
    Center(
        child: Column(
          children: <Widget>[
            new Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextFormField(
                        decoration: new InputDecoration(labelText: "Username"),
                        onSaved: (val) => username = val,
                        keyboardType: TextInputType.emailAddress),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextFormField(
                      decoration: new InputDecoration(labelText: "Password"),
                      onSaved: (val) => password = val,
                      obscureText: true,
                    ),
                  ),
                  RaisedButton(
                    child: Text('Login'),
                    onPressed: _register,
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}