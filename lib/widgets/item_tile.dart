import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFFF0F0F0),
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.65,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Blue Summer Dress',
              style: TextStyle(
                  color: Color(0xFF202F36),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'For Women',
              style: TextStyle(
                color: Color(0xFF202F36),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              child: Text(
                '\$120.00',
                style: TextStyle(
                    color: Color(0xFF202F36),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
