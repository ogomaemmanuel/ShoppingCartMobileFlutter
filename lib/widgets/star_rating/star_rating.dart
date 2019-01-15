import 'package:flutter/material.dart';
import 'package:hello_world/widgets/star_rating/star.dart';

class StarRating extends StatelessWidget {
 final Function onChanged;
 int rating;
  StarRating({this.rating=0,this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Row(
        children: (new List.generate(5, (i) => i + 1)).map((num) {
      return Star(
        starValue: num,
        onPressed: onChanged,
        userRating: rating,
      );
    }).toList());
  }
}
