import 'package:flutter/material.dart';
import 'package:hello_world/pages/products/products.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  String password;
  String username;

  void _login() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                 ProductsPage()));
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
                  RaisedButton(
                    child: Text('Login'),
                    onPressed: _login,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
