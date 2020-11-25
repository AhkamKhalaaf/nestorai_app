import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nestorai_app/models/Nestori.dart';
import 'package:nestorai_app/ui/Text_icon_widget.dart';
class Property_item extends StatelessWidget
{
  final Listing listing;
  Property_item({@required this.listing});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding:EdgeInsets.all(5.0),
      child: Container(height: 100.0,child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
        Container(width: 80.0,height: 90,decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),image: DecorationImage(image: NetworkImage(listing.imgUrl??listing.thumbUrl),fit: BoxFit.fill)),),
        SizedBox(width: 10.0,),
        Expanded(
          child: Container(child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
            Text(listing.title,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.deepPurple),),
            Text("by ${listing.listerName ??"unavailable"}",style: Theme.of(context).textTheme.body2.copyWith(color: Colors.grey)),
            SizedBox(height: 10.0,),
            Row( mainAxisAlignment: prefix0.MainAxisAlignment.spaceBetween,children: <Widget>[
              Text(listing.priceFormatted,style: Theme.of(context).textTheme.headline),
              Row(children: <Widget>[
                TextIcon(Size: 12,Iscolumn: false,icon: FontAwesomeIcons.bed,text: listing.bedroomNumber.toString()!=""?listing.bedroomNumber.toString():'#',),
                SizedBox(width: 10.0,),
                TextIcon(Size: 12,Iscolumn: false,icon: FontAwesomeIcons.shower,text: listing.bathroomNumber.toString()!=""?listing.bathroomNumber.toString():'#',),
              ],)
            ],)
          ],),),
        ),
        SizedBox(width: 10.0,),
      ],),),
    );
  }

}