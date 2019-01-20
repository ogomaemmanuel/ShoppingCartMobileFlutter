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
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            buildSocialLoginButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: <Widget>[
        Expanded(
            
            child: MaterialButton(
              child: Icon(FontAwesomeIcons.googlePlusG,color: Color(0xFFFFFFFF)),
              color:   Color(0xFFDD4B39),
              onPressed: () {},
            )),
            SizedBox(width: 10.0),
        Expanded(
            child: MaterialButton(
              child: Icon(FontAwesomeIcons.facebook,color: Color(0xFFFFFFFF),),
              color: Color(0xFF3B5998),
              onPressed: () {},
            ))
      ],
    );
  }
}
