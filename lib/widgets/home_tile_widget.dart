import 'package:flutter/material.dart';

class HomePageTile extends StatelessWidget {
  const HomePageTile({
    Key key,
    @required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black)),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
      ),
    );
  }
}