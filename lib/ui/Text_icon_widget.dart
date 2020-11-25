import 'package:flutter/material.dart';
class TextIcon extends StatelessWidget
{
  final IconData icon;
  final String text;
  final bool Iscolumn;
  final double Size;
  TextIcon({@required this.icon,
    @required this.text,
     this.Iscolumn=true,
     this.Size});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Iscolumn?Container(height: 50.0,child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
      Icon(icon, size: Size,),
      SizedBox(height: 10.0,),
      Text(text,style: TextStyle( fontSize: Size),)
    ],),):Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
      Text(text,style: TextStyle( fontSize: Size),),
      SizedBox(width: 5.0,),
      Icon(icon, size: Size,),
    ],),);
  }

}