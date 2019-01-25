import 'package:flutter/material.dart';
import 'package:hello_world/pages/forgot_password/forgot_password.dart';
import 'package:hello_world/pages/home/home.dart';
import 'package:hello_world/pages/products/products.dart';
import 'package:hello_world/pages/register/register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  String password;
  String username;
  void _goToregister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }
  void _login() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
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
                  new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                          constraints:
                              const BoxConstraints(minWidth: double.infinity),
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(40.0)),
                            child: Text('Login'),
                            onPressed: _login,
                          ))),
                  new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                          constraints:
                              const BoxConstraints(minWidth: double.infinity),
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(40.0)),
                            child: Text('Register'),
                            onPressed: _goToregister,
                          ))),
                  GestureDetector(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: double.infinity),
                            child: Center(
                              child: Text('Forgot Password'),
                            ))),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgotPassWordPage();
                      }));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
