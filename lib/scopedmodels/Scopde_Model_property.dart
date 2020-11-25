import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:nestorai_app/Local_Service.dart';
import 'package:nestorai_app/apiservices/ApiServicesss.dart';
import 'package:nestorai_app/models/Nestori.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as httprequest;

class Propertyscopdemodel extends Model {
  ScrollController controller = new ScrollController();
  int Totallistsize;
  String searchresult = 'Start Search';
  List<dynamic> _listsetting = [];
  List<dynamic> _subblistsetting = [];
  int _total_pages;
  bool _hasemorepages = true;
  bool _Isloading = false;
  ApiService apiService = Locator<ApiService>();
  List<dynamic> get listingsdata => _listsetting;
  bool get Loadingg => _Isloading;
  int getproperylength() => listingsdata.length;
  int get resulttotall => Totallistsize;
  int get total_pages => _total_pages;
  bool get hase_more_pages => _hasemorepages;
  String get Country =>_country;
  String get Sort =>_sort;
  String get listingtype =>_lisitingtype;

  List<Map<String,String>>ListingTypelist=[
    {'name':'Buy','value':'buy'},
    {'name':'Rent','value':'rent'},
    {'name':'Share','value':'share'}
  ];

  String _lisitingtype="rent";
  List<Map<String,String>>countryList=[
    {'name':'Barzil','value':'br'},
    {'name':'France','value':'fr'},
    {'name':'Germany','value':'de'},
    {'name':'India','value':'in'},
    {'name':'Iatly','value':'it'},
    {'name':'Mexico','value':'mx'},
    {'name':'Spain','value':'es'},
    {'name':'United Kingdom','value':'uk'},

  ];

  String _country = 'uk';
  List<Map<String,String>>sortlist=[
    {'name':'Relevancy','value':'relevancy'},
    {'name':'Bedroom(Acending)','value':'bedroom_lowhigh'},
    {'name':'Bedroom(Descending)','value':'bedroom_highlow'},
    {'name':'price(Acending)','value':'price_lowhigh'},
    {'name':'price(Descending)','value':'price_highlow'},
    {'name':'Newest','value':'newest'},
    {'name':'Oldest','value':'oldest'},
    {'name':'Random','value':'random'},
    {'name':'Distance','value':'distance'},

  ];

  String _sort = 'relevancy';
  Future GetProperities(String place, [int page = 1]) async {
    print(page);

    if (page == 1) {

      _subblistsetting.clear();
      _listsetting.clear();
      _Isloading = true;
    }

    notifyListeners();
    final welcome = await apiService.GetData(place,_country,_lisitingtype,_sort,page);
    _subblistsetting = welcome['response']['listings']
        .map((mappp) => Listing.fromJson(mappp))
        .toList();
    _subblistsetting.forEach((ineitwmm){
      _listsetting.add(ineitwmm);
    });

    if (_listsetting.isEmpty) {
      searchresult = 'no data found';
    }

    _total_pages = welcome['response']['total_pages'];
    Totallistsize = welcome['response']['total_results'];
  print('${welcome['response']['page'] }pppp');
    if (welcome['response']['page'] == _total_pages) {
      _hasemorepages = false;
    }
    notifyListeners();
    if(page==1)
      {
        _Isloading = false;
      }
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if(hase_more_pages)
          {
            page ++;
            GetProperities(place,page);
            print('${page}ennnd');
          }

      }
    });
  }
  void SetCountry(String value)
  {
    _country = value;
    notifyListeners();
  }
  void SetSort(String value)
  {
    _sort = value;
    notifyListeners();
  }
  void SetLisitingtype(String value)
  {
    _lisitingtype = value;
    notifyListeners();
  }

 }
