import 'package:flutter/material.dart';

class ForgotPassWordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ForgotPassWordPageState();
  }
}

class _ForgotPassWordPageState extends State<ForgotPassWordPage> {
  final formKey = new GlobalKey<FormState>();
  String password;
  String username;
  String confirmPassword;

  void _resetPassWord() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Forgot Password")),
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
                          decoration:
                              new InputDecoration(labelText: "Username"),
                          onSaved: (val) => username = val,
                          keyboardType: TextInputType.emailAddress),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        decoration:
                            new InputDecoration(labelText: "New Password"),
                        onSaved: (val) => password = val,
                        obscureText: true,
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Confirm New Password"),
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
                                  borderRadius:
                                      new BorderRadius.circular(40.0)),
                              child: Text('Submit'),
                              onPressed: _resetPassWord,
                            ))),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
