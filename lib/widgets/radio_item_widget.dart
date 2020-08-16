import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {

  final RadioModel item;

  const RadioItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height *0.06,
      width: MediaQuery.of(context).size.width * 0.08,
      child: Center(
        child: Text(item.buttonText,
          style: TextStyle(
              color: item.isSelected ? Colors.white : Colors.black,
              fontSize: 11.0, fontWeight: FontWeight.bold
          ),),
      ),
      decoration: BoxDecoration(
          color: item.isSelected ? Colors.black : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.0,
            color: Colors.black,
          ),
//          borderRadius: BorderRadius.all(Radius.circular(2.0))
      ),
    );
  }
}


class RadioModel{
  bool isSelected;
  final String buttonText;
  final Color color;

  RadioModel({this.color,this.buttonText, this.isSelected});
}
