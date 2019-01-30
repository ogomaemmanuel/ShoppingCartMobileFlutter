import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = new GlobalKey<FormState>();
  String username;
  String password;
  String confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body:SingleChildScrollView(child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            buildSocialLoginButtons(),
            Row(
              children: <Widget>[
                Expanded(child: Container(height: 1.5, color: Colors.black)),
                SizedBox(
                    width: 20,
                    child: Center(
                      child: Text("Or"),
                    )),
                Expanded(child: Container(height: 1.5, color: Colors.black)),
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                    decoration: new InputDecoration(labelText: "First Name"),
                    onSaved: (val) => username = val,
                    keyboardType: TextInputType.emailAddress),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: TextFormField(
                    decoration: new InputDecoration(labelText: "Second Name"),
                    onSaved: (val) => username = val,
                    keyboardType: TextInputType.emailAddress),
              )
            ]),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                    decoration: new InputDecoration(labelText: "Email"),
                    onSaved: (val) => username = val,
                    keyboardType: TextInputType.emailAddress),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                    decoration: new InputDecoration(labelText: "Phone"),
                    onSaved: (val) => username = val,
                    keyboardType: TextInputType.emailAddress),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                    decoration: new InputDecoration(labelText: "Password"),
                    onSaved: (val) => username = val,
                    keyboardType: TextInputType.emailAddress),
              ),
            ]),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                    child: MaterialButton(
                  child: Text("Next"),
                  onPressed: () {},
                ))
              ],
            )
          ],
        ),
      ),
    )
    );
  }

  Widget buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
            child: MaterialButton(
          child: Icon(FontAwesomeIcons.googlePlusG, color: Color(0xFFFFFFFF)),
          color: Color(0xFFDD4B39),
          onPressed: () {},
        )),
        SizedBox(width: 10.0),
        Expanded(
            child: MaterialButton(
          child: Icon(
            FontAwesomeIcons.facebook,
            color: Color(0xFFFFFFFF),
          ),
          color: Color(0xFF3B5998),
          onPressed: () {},
        )),
      ],
    );
  }
}
