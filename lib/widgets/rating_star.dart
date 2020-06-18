import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  
  final int rating;
  RatingStar(this.rating);



  @override
  Widget build(BuildContext context) {
    String stars='';
      for (var i = 0; i < rating; i++) {
        stars+='⭐  ';
  }
  stars.trim();
    return Text(stars,style: TextStyle(fontSize: 18.0),);
  
  
  }
}