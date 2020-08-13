import 'package:flutter/material.dart';

class StackImage extends StatelessWidget {
  final int counter;

  const StackImage({Key key, this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (counter % 3) {
      case 0:
        return HomeCards(
          color: Color(0xFFFFD16C),
          text: 'Yellow Summer Dress',
          image: 'assets/images/yellow-dress.png',
        );
      case 1:
        return HomeCards(
          color: Colors.lightGreen,
          text: 'Green Summer Dress',
          image: 'assets/images/green-dress.png',
        );
      case 2:
        return HomeCards(
          color: Colors.redAccent,
          text: 'Red Summer Dress',
          image: 'assets/images/red-dress.png',
        );
      default:
        return Container();
    }
  }
}

class HomeCards extends StatelessWidget {
  const HomeCards({
    Key key,
    this.color,
    this.text,
    this.image, this.secondColor,
  }) : super(key: key);

  final Color color;
  final Color secondColor;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          top: MediaQuery.of(context).size.height * 0.24,
          right: MediaQuery.of(context).size.width * 0.43,
          child: ConstrainedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.25,
            ),
          ),
        ),
        Positioned(
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.43,
          child: Container(
            child: Text(
              '\$100',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(20.0),
          ),
        )
      ],
    );
  }
}
