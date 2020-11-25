import 'package:http/http.dart' as httprequest;
import 'dart:convert';
import 'package:nestorai_app/models/Nestori.dart';
import 'package:nestorai_app/models/Nestori.dart';
class ApiService
{
   Future<dynamic> GetData(String place,String country,String Lisiting_type,String sort,[int page=1])async
  {
    String toplevelDomain = country;
    if(country == 'br')
      {
        toplevelDomain = "com.$country";
      }
    else if(country =='uk')
      {
        toplevelDomain = "co.$country";
      }
     var urii = Uri.https("api.nestoria.$toplevelDomain", "/api",
    {
      "encoding":"json",
      "pretty":"1",
      "action":"search_listings",
      "country":"uk",
      "listing_type":"buy",
      "number_of_results":"20",
      "page":page.toString(),
      "place_name":place,
      "Listing_type":Lisiting_type,
      "sort":sort
      //"place_name":place.isEmpty ?place :'brighton'

    });
    print('${urii},,,,,,,,,,ppppppppppp');
   try
   {
     final reponse = await httprequest.get(urii);
     ///List Propertieslist = json.decode(reponse.body)['response']['listings'];
    // print('${Propertieslist.length}dooooooooooooooooooooone');
     return json.decode(reponse.body) ;
   }
   catch(ex)
    {
      print('${ex}kokokoko');
    }

  }
}