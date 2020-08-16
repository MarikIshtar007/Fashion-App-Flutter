import 'package:flutter/material.dart';
import 'package:fashion_app/screens/item_screen.dart';

class ItemTile extends StatelessWidget {

  final String imageUrl;
  final String title;

  const ItemTile({
    Key key, this.imageUrl, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ItemScreen(title: title, imageUrl: imageUrl)
        ));
      },
      child: Container(
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
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
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
              Positioned(
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.15,
                child: Hero(tag: imageUrl, child: Image.asset(imageUrl, height: MediaQuery.of(context).size.height *0.4,)),
              )
            ]
          ),
        ),
      ),
    );
  }
}
