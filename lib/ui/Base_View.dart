import 'package:flutter/material.dart';
import 'package:nestorai_app/Local_Service.dart';
import 'package:scoped_model/scoped_model.dart';

class Base_view<T extends Model> extends StatefulWidget {
  final ScopedModelDescendantBuilder<T> builder;
  final Function(T) onmodelRely;
  Base_view({ScopedModelDescendantBuilder<T> builder,this.onmodelRely}) : builder = builder;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Baseviewstata<T>();
  }
}
class Baseviewstata <T extends Model> extends State<Base_view<T>>
{
  T _model = Locator<T>();
  @override
  void initState() {
    // TODO: implement initState
    if(widget.onmodelRely!=null)
      {
        widget.onmodelRely(_model);
      }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<T>(model:_model
      ,child: ScopedModelDescendant<T>(builder: widget.builder,),);
  }

}
