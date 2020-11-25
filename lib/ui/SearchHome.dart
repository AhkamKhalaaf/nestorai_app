import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nestorai_app/scopedmodels/Scopde_Model_property.dart';
import 'package:nestorai_app/ui/Base_View.dart';
import 'package:nestorai_app/ui/DetailScreen.dart';
import 'package:nestorai_app/ui/Property_item.dart';
import 'package:nestorai_app/ui/SearchWidget.dart';

class SeachHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeStat();
  }

}

class HomeStat extends State<SeachHome>
{
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Base_view<Propertyscopdemodel>(
        builder: (context, child, model) => SafeArea(
            child: Scaffold(
              body: CustomScrollView(
                controller: model.controller,
                slivers: <Widget>[
                  SliverAppBar(floating: true,snap: true,
                      title: SearchWidget(
                        Performancesearch: model.GetProperities,
                      )),
                  model.Loadingg
                      ? SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
                  )
                      : model.getproperylength() < 1
                      ? SliverFillRemaining(
                    child: Center(
                        child: Text(
                          model.searchresult,
                          style: Theme.of(context).textTheme.headline,
                        )),
                  )
                      : SliverList(
                      delegate:
                      SliverChildBuilderDelegate((context, index) {
                        if(index == model.getproperylength() +1)
                        {
                          if(model.hase_more_pages)
                          {
                            return Container(padding: EdgeInsets.all(10.0),child: Center(child: CircularProgressIndicator()),);
                          }
                          else {
                            return Container();
                          }
                        }
                        else if(index==0){
                          return Container(padding: EdgeInsets.all(10.0),child: Text('${model.Totallistsize.toString()}  results',
                            style: Theme.of(context).textTheme.body2.copyWith(color: Colors.grey),),);
                        }
                        else {
                          return Column(
                            children: <Widget>[
                              InkWell(child: Property_item(
                                listing: model.listingsdata[index - 1],
                              ),onTap: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailScreen(model.listingsdata[index - 1])));
                              },),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: Divider(
                                  height: 0.2,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              )
                            ],
                          );
                        }

                      }, childCount: model.getproperylength() + 2))
                ],
              ),
            )));
  }

}
