import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomStackWidget extends StatefulWidget {
  @override
  _CustomStackWidgetState createState() => _CustomStackWidgetState();
}

class _CustomStackWidgetState extends State<CustomStackWidget> {
  double currentPage = 0.0;

  var colors = [
    Colors.orange,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.purple,
    Colors.blueGrey
  ];

  List<Widget> get dummys {
    List<Widget> dummys = List();
    this.colors.forEach((element) {
      dummys.add(Container());
    });
    return dummys;
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: 400,
      width: double.infinity,
      child: Stack(
//        alignment: Alignment.center,
        children: <Widget>[
          CardsStacked(currentPage: currentPage, colors: colors),
          Positioned.fill(
            child: PageView(
              children: this.dummys,
              controller: pageController,
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}

class CardsStacked extends StatelessWidget {

  final double currentPage;
  final List<Color> colors;
  final padding = 20.0;
  final verticalInset = 20.0;

  const CardsStacked({Key key, this.currentPage, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constructor){
          List<Widget> cardList = List();
          var primaryHeight = constructor.maxHeight *0.8;
          var primaryWidth = primaryHeight * 0.75;

          for(int i = colors.length -1 ; i>-1;i--){
            var delta = i- currentPage;
            var isOnRight = delta >=0;
            var item = Positioned(
              right: delta +50,
              top: delta * (primaryHeight/11) +30 - (isOnRight?0 :(400 * -delta)),
              child: Transform.scale(
                scale: math.min(1.0, -0.13 * delta +1.05),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20 - delta*2.2)),
                    color: colors[i]
                  ),
                  height: primaryHeight,
                  width: primaryWidth,
                ),
              ),
            );
            cardList.add(item);
          }
          return Stack(children: cardList,);
        },
      ),
    );
  }
}
