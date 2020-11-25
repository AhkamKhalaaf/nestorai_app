import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nestorai_app/models/Nestori.dart';
import 'package:nestorai_app/ui/Text_icon_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Listing listing;

  const DetailScreen(this.listing);

  static const routname = '/detailscreen';
  _launchURL(BuildContext context,String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
     Scaffold.of(context).showSnackBar(SnackBar(content: Text('can not load ${url}')));
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Builder( builder:(context)=> FlatButton.icon(
                  onPressed: () {
                    _launchURL(context,listing.listerUrl);
                  },
                  icon: Icon(
                    Icons.launch,

                  ),
                  label: Text(
                    'visit Lists',

                  ),
                  textColor: Colors.white,)
                ))
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    listing.imgUrl,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 20.0,
                      left: 0.0,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        color: Color.fromRGBO(255, 255, 255, .5),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.tag,
                              color: Colors.deepOrange,
                              size: 20.0,
                            ),
                            Text(
                              listing.priceFormatted,
                              style: Theme.of(context).textTheme.title,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(bottom: 4),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    listing.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextIcon(
                          Iscolumn: true,
                          icon: FontAwesomeIcons.bed,
                          text: "${listing.bedroomNumber ?? "#"} Bedroom",
                        ),
                        TextIcon(
                          Iscolumn: true,
                          icon: FontAwesomeIcons.shower,
                          text: "${listing.bathroomNumber ?? "#"} Bathroom",
                        ),
                        TextIcon(
                          Iscolumn: true,
                          icon: FontAwesomeIcons.bed,
                          text: "${listing.carSpaces ?? "#"} CarSpaces",
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 4.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                    child: Container(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    'Summary',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    listing.summary,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Tags',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Wrap(
                    runSpacing: 5.0,
                    spacing: 5.0,
                    children: listing.keywords
                        .split(",")
                        .map((onn) => Chip(
                            backgroundColor: Colors.deepOrange,
                            label: Text(onn)))
                        .toList(),
                  ),
                  SizedBox(
                    height: 10.0,
                    child: Container(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'Lister',
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 20.0),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text('${listing.listerName ?? "unavailable"}'),
                          subtitle: Text(
                              '${listing.datasourceName ?? "source unavailable"}'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    ));
  }
}
