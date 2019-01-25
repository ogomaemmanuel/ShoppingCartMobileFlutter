import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  final String message;
  ReceivedMessage({this.message});
  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Material(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(20),
            child:Padding(
              padding: EdgeInsets.all(20.0),
              child:Container(
  width: 230.0,
  child: Text(
    message
  ),
)
              
               //Text(message),
            ) 
          )
          
          ],
      
    );
  }
}
