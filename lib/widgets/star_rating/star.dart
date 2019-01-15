import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  final Function onPressed;
  final int starValue;
  final int userRating;
  Star({this.starValue,this.userRating, this.onPressed});
  @override
  State<StatefulWidget> createState() {
    return new _StarState();
  }
}

class _StarState extends State<Star> {
  Function onPressed;
  int starValue;
  int userRating;
  @override
  void initState() {
    onPressed = widget.onPressed;
    starValue = widget.starValue;
    userRating=widget.userRating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.star;
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        if (onPressed != null) {
          onPressed(userRating);
        }
      },
    );
  }
}
