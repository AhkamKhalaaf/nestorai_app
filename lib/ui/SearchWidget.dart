import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nestorai_app/ui/Settingsscreen.dart';
class SearchWidget extends StatelessWidget
{
   final Performancesearch;
   SearchWidget({@required this.Performancesearch});
  //const SearchWidget({Key key,@required this.Performancesearch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(elevation: 5.0,child: Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
        GestureDetector(child: Icon(FontAwesomeIcons.search,color: Colors.black54,),),
        SizedBox(width: 10.0,),
        Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none,hintText: '..search'),
          onSubmitted: (String place){

          Performancesearch(place);
            print('ahkamammaa');
          },))
      ,
        Builder(builder: (context)=>InkWell(onTap: (){
          Navigator.of(context).pushNamed(SettingsScreen.routname);
        },child: Icon(FontAwesomeIcons.slidersH,color: Colors.black54,),),)],),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }

}