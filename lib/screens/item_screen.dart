import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ItemScreen({Key key, this.title, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          actions: <Widget>[
            Padding(
              child: Icon(Icons.favorite_border),
              padding: const EdgeInsets.only(right: 10.0),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                  color: Color(0xFFCACACA),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(70.0),),),
              child: Image.asset(imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Women', style: TextStyle(color: Colors.grey),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('\$120.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
            ),
          ],
        ));
  }
}
