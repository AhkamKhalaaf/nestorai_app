import 'package:flutter/material.dart';
import 'package:nestorai_app/scopedmodels/Scopde_Model_property.dart';
import 'package:nestorai_app/ui/Base_View.dart';
import 'package:nestorai_app/ui/DropDown_button.dart';

class SettingsScreen extends StatelessWidget {
  static const routname = '/Settingsscreeen';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Base_view<Propertyscopdemodel>(
      builder: (context, child, model) => SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
            body: ListView(children: <Widget>[
              ListTile(subtitle: Text(model.Country),title: Text('Country'),
              trailing: DropDownButton(value: model.Country,
              items: model.countryList,
              onChanged: model.SetCountry,),),
              Divider(),
              ListTile(subtitle: Text(model.listingtype),title: Text('Lisiting type'),
                trailing: DropDownButton(value: model.listingtype,
                  items: model.ListingTypelist,
                  onChanged: model.SetLisitingtype,),),
              Divider(),
              ListTile(subtitle: Text(model.Sort),title: Text('Sort'),
                trailing: DropDownButton(value: model.Sort,
                  items: model.sortlist,
                  onChanged: model.SetSort,),),
              Divider()
            ],),
      )),
    );
  }
}
