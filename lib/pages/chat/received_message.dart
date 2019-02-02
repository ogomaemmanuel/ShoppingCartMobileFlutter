import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  final String message;
  ReceivedMessage({this.message});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Material(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  width: 230.0,
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              
                ))
      ],
    );
  }
}
