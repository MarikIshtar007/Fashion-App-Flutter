import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<ClothItems> items = List<ClothItems>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(ClothItems(imageUrl: 'assets/images/green-dress.png', size: 'M', cost: '\$120.00', name: 'Green Summer Dress'));
    items.add(ClothItems(imageUrl: 'assets/images/yellow-dress.png', size: 'L', cost: '\$120.00', name: 'Yellow Summer Dress'));
    items.add(ClothItems(imageUrl: 'assets/images/red-dress.png', size: 'M', cost: '\$120.00', name: 'Red Summer Dress'));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8),
              child: Text(
                'Cart',
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 8),
              child: Text('3 items added', style: TextStyle(fontSize: 17.0, color: Colors.grey,),),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      child: ListTile(
                        leading: Image.asset(items[index].imageUrl),
                        title: Text(items[index].name),
                      ),
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: AlignmentDirectional.centerStart,
                        color: Colors.red,
                        child: Icon(Icons.delete_sweep),
                      ),
                      key: ValueKey(items[index].name),
                      onDismissed: (direction){
                        setState(() {
                          items.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Total:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0, left: 8.0),
                      child: Text('\$360.00', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                RaisedButton(
                  onPressed: (){},
                  child: Text('Proceed to Checkout', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                  color: Colors.brown[700],
                  clipBehavior: Clip.antiAlias,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ClothItems{
  final String imageUrl;
  final String size;
  final String cost;
  final String name;

  ClothItems({this.imageUrl, this.size, this.cost, this.name});
}
