import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isFav = !isFav;
        });
      },
      child: isFav? Icon(Icons.favorite, color: Colors.red,): Icon(Icons.favorite_border),
    );
  }
}
