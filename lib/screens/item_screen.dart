import 'package:flutter/material.dart';
import 'package:fashion_app/widgets/radio_item_widget.dart';
import 'package:fashion_app/widgets/favorite_icon_widget.dart';

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
              padding: const EdgeInsets.all(8.0),
              child: FavoriteIcon(),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
              decoration: BoxDecoration(
                  color: Color(0xFFCACACA),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(70.0),),),
              child: Hero(tag: imageUrl,child: Image.asset(imageUrl)),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'lorem ipsum dolor sit amet.. consecutor sed diam nonummy ticndidun ut laoreet Duis Aitem vel enum iriure dolor in henderit in bulpate. Requiescat in pace. Va bene. Machiavele donto na bano sen nighnig eros, hant.'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizesRadioButtons(),
                Divider(height: 10),
                ColorRadioButtons(),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              width: MediaQuery.of(context).size.width * 0.35,
              child: Builder(
                builder: (context)=> RaisedButton(
                  color: Colors.blueAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.shopping_cart, size: 16.0,),
                      SizedBox(width: 10,),
                      Text('Add to Cart', style: TextStyle(fontSize: 12.0),)
                    ],
                  ),
                  onPressed: (){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: <Widget>[
                            Icon(Icons.thumb_up),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Text('Item added to Cart Successfully'),
                            )
                          ],
                        ),
                      )
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}

class SizesRadioButtons extends StatefulWidget {
  @override
  _SizesRadioButtonsState createState() => _SizesRadioButtonsState();
}

class _SizesRadioButtonsState extends State<SizesRadioButtons> {
  List<RadioModel> sizeList = List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sizeList.add(RadioModel(isSelected: false, buttonText: 'S'));
    sizeList.add(RadioModel(isSelected: false, buttonText: 'M'));
    sizeList.add(RadioModel(isSelected: false, buttonText: 'L' ));
    sizeList.add(RadioModel(isSelected: false, buttonText: 'XL'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Sizes',textAlign: TextAlign.left, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
        ),
        Container(
          height: MediaQuery.of(context).size.height *0.06,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizeList.length,
            shrinkWrap: true,
            itemBuilder: (context, int index){
              return InkResponse(
                splashColor: Colors.grey,
                radius: 25,
                onTap: (){
                  setState(() {
                    sizeList.forEach((element) => element.isSelected = false);
                    sizeList[index].isSelected = true;
                  });
                },
                child: RadioItem(item: sizeList[index]),
              );
            },
          ),
        )
      ],
    );
  }
}

class ColorRadioButtons extends StatefulWidget {
  @override
  _ColorRadioButtonsState createState() => _ColorRadioButtonsState();
}

class _ColorRadioButtonsState extends State<ColorRadioButtons> {
  List<RadioModel> colorList = List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorList.add(RadioModel(color: Colors.red,isSelected: false));
    colorList.add(RadioModel(color: Colors.yellow,isSelected: false));
    colorList.add(RadioModel(color: Colors.blue,isSelected: false));
    colorList.add(RadioModel(color: Colors.deepPurpleAccent,isSelected: false));
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Colours', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
        ),
        Container(
          height: MediaQuery.of(context).size.height *0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colorList.length,
            shrinkWrap: true,
            itemBuilder: (context, int index){
              return InkResponse(
                splashColor: Colors.grey,
                radius: 25,
                onTap: (){
                  setState(() {
                    colorList.forEach((element) => element.isSelected = false);
                    colorList[index].isSelected = true;
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height *0.04,
                  child: CircleAvatar(
                    backgroundColor: colorList[index].color,
                    foregroundColor: colorList[index].color,
                  ),
                  decoration: BoxDecoration(
                    color: colorList[index].color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: colorList[index].isSelected ? Colors.black : Colors.transparent
                    ),
//          borderRadius: BorderRadius.all(Radius.circular(2.0))
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}



