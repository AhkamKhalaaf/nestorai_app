// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Request request;
  Response response;

  Welcome({
    @required this.request,
    @required this.response,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    request: Request.fromJson(json["request"]),
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "request": request.toJson(),
    "response": response.toJson(),
  };
}

class Request {
  String country;
  String language;
  String location;
  String numRes;
  int offset;
  String output;
  int page;
  String pretty;
  String productType;
  String propertyType;
  SizeType sizeType;
  String sizeUnit;
  String sort;
  ListingType listingType;

  Request({
    @required this.country,
    @required this.language,
    @required this.location,
    @required this.numRes,
    @required this.offset,
    @required this.output,
    @required this.page,
    @required this.pretty,
    @required this.productType,
    @required this.propertyType,
    @required this.sizeType,
    @required this.sizeUnit,
    @required this.sort,
    @required this.listingType,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    country: json["country"],
    language: json["language"],
    location: json["location"],
    numRes: json["num_res"],
    offset: json["offset"],
    output: json["output"],
    page: json["page"],
    pretty: json["pretty"],
    productType: json["product_type"],
    propertyType: json["property_type"],
    sizeType: sizeTypeValues.map[json["size_type"]],
    sizeUnit: json["size_unit"],
    sort: json["sort"],
    listingType: listingTypeValues.map[json["listing_type"]],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "language": language,
    "location": location,
    "num_res": numRes,
    "offset": offset,
    "output": output,
    "page": page,
    "pretty": pretty,
    "product_type": productType,
    "property_type": propertyType,
    "size_type": sizeTypeValues.reverse[sizeType],
    "size_unit": sizeUnit,
    "sort": sort,
    "listing_type": listingTypeValues.reverse[listingType],
  };
}

enum ListingType { BUY }

final listingTypeValues = EnumValues({
  "buy": ListingType.BUY
});

enum SizeType { NET }

final sizeTypeValues = EnumValues({
  "net": SizeType.NET
});

class Response {
  String applicationResponseCode;
  String applicationResponseText;
  Attribution attribution;
  String createdHttp;
  int createdUnix;
  String linkToUrl;
  List<Listing> listings;
  List<Location> locations;
  int page;
  String sort;
  String statusCode;
  String statusText;
  String thanks;
  int totalPages;
  int totalResults;
  String cu5T0MP434M;

  Response({
    @required this.applicationResponseCode,
    @required this.applicationResponseText,
    @required this.attribution,
    @required this.createdHttp,
    @required this.createdUnix,
    @required this.linkToUrl,
    @required this.listings,
    @required this.locations,
    @required this.page,
    @required this.sort,
    @required this.statusCode,
    @required this.statusText,
    @required this.thanks,
    @required this.totalPages,
    @required this.totalResults,
    @required this.cu5T0MP434M,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    applicationResponseCode: json["application_response_code"],
    applicationResponseText: json["application_response_text"],
    attribution: Attribution.fromJson(json["attribution"]),
    createdHttp: json["created_http"],
    createdUnix: json["created_unix"],
    linkToUrl: json["link_to_url"],
    listings: List<Listing>.from(json["listings"].map((x) => Listing.fromJson(x))),
    locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
    page: json["page"],
    sort: json["sort"],
    statusCode: json["status_code"],
    statusText: json["status_text"],
    thanks: json["thanks"],
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
    cu5T0MP434M: json["_cu5t0mP434m_"],
  );

  Map<String, dynamic> toJson() => {
    "application_response_code": applicationResponseCode,
    "application_response_text": applicationResponseText,
    "attribution": attribution.toJson(),
    "created_http": createdHttp,
    "created_unix": createdUnix,
    "link_to_url": linkToUrl,
    "listings": List<dynamic>.from(listings.map((x) => x.toJson())),
    "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
    "page": page,
    "sort": sort,
    "status_code": statusCode,
    "status_text": statusText,
    "thanks": thanks,
    "total_pages": totalPages,
    "total_results": totalResults,
    "_cu5t0mP434m_": cu5T0MP434M,
  };
}

class Attribution {
  int imgHeight;
  String imgUrl;
  int imgWidth;
  String linkToImg;

  Attribution({
    @required this.imgHeight,
    @required this.imgUrl,
    @required this.imgWidth,
    @required this.linkToImg,
  });

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
    imgHeight: json["img_height"],
    imgUrl: json["img_url"],
    imgWidth: json["img_width"],
    linkToImg: json["link_to_img"],
  );

  Map<String, dynamic> toJson() => {
    "img_height": imgHeight,
    "img_url": imgUrl,
    "img_width": imgWidth,
    "link_to_img": linkToImg,
  };
}

class Listing {
  dynamic bathroomNumber;
  int bedroomNumber;
  String carSpaces;
  int commission;
  int constructionYear;
  DatasourceName datasourceName;
  int imgHeight;
  String imgUrl;
  int imgWidth;
  String keywords;
  double latitude;
  String listerUrl;
  ListingType listingType;
  int locationAccuracy;
  double longitude;
  int price;
  PriceCurrency priceCurrency;
  String priceFormatted;
  int priceHigh;
  int priceLow;
  PriceType priceType;
  PropertyType propertyType;
  int size;
  SizeType sizeType;
  String summary;
  int thumbHeight;
  String thumbUrl;
  int thumbWidth;
  String title;
  int updatedInDays;
  UpdatedInDaysFormatted updatedInDaysFormatted;
  String listerName;

  Listing({
    @required this.bathroomNumber,
    @required this.bedroomNumber,
    @required this.carSpaces,
    @required this.commission,
    @required this.constructionYear,
    @required this.datasourceName,
    @required this.imgHeight,
    @required this.imgUrl,
    @required this.imgWidth,
    @required this.keywords,
    @required this.latitude,
    @required this.listerUrl,
    @required this.listingType,
    @required this.locationAccuracy,
    @required this.longitude,
    @required this.price,
    @required this.priceCurrency,
    @required this.priceFormatted,
    @required this.priceHigh,
    @required this.priceLow,
    @required this.priceType,
    @required this.propertyType,
    @required this.size,
    @required this.sizeType,
    @required this.summary,
    @required this.thumbHeight,
    @required this.thumbUrl,
    @required this.thumbWidth,
    @required this.title,
    @required this.updatedInDays,
    @required this.updatedInDaysFormatted,
    @required this.listerName,
  });

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
    bathroomNumber: json["bathroom_number"],
    bedroomNumber: json["bedroom_number"],
    carSpaces: json["car_spaces"].toString(),
    commission: json["commission"],
    constructionYear: json["construction_year"],
    datasourceName: datasourceNameValues.map[json["datasource_name"]],
    imgHeight: json["img_height"],
    imgUrl: json["img_url"],
    imgWidth: json["img_width"],
    keywords: json["keywords"],
    latitude: json["latitude"].toDouble(),
    listerUrl: json["lister_url"],
    listingType: listingTypeValues.map[json["listing_type"]],
    locationAccuracy: json["location_accuracy"],
    longitude: json["longitude"].toDouble(),
    price: json["price"],
    priceCurrency: priceCurrencyValues.map[json["price_currency"]],
    priceFormatted: json["price_formatted"],
    priceHigh: json["price_high"],
    priceLow: json["price_low"],
    priceType: priceTypeValues.map[json["price_type"]],
    propertyType: propertyTypeValues.map[json["property_type"]],
    size: json["size"],
    sizeType: sizeTypeValues.map[json["size_type"]],
    summary: json["summary"],
    thumbHeight: json["thumb_height"],
    thumbUrl: json["thumb_url"],
    thumbWidth: json["thumb_width"],
    title: json["title"],
    updatedInDays: json["updated_in_days"],
    updatedInDaysFormatted: updatedInDaysFormattedValues.map[json["updated_in_days_formatted"]],
    listerName: json["lister_name"] == null ? null : json["lister_name"],
  );

  Map<String, dynamic> toJson() => {
    "bathroom_number": bathroomNumber,
    "bedroom_number": bedroomNumber,
    "car_spaces": carSpaces,
    "commission": commission,
    "construction_year": constructionYear,
    "datasource_name": datasourceNameValues.reverse[datasourceName],
    "img_height": imgHeight,
    "img_url": imgUrl,
    "img_width": imgWidth,
    "keywords": keywords,
    "latitude": latitude,
    "lister_url": listerUrl,
    "listing_type": listingTypeValues.reverse[listingType],
    "location_accuracy": locationAccuracy,
    "longitude": longitude,
    "price": price,
    "price_currency": priceCurrencyValues.reverse[priceCurrency],
    "price_formatted": priceFormatted,
    "price_high": priceHigh,
    "price_low": priceLow,
    "price_type": priceTypeValues.reverse[priceType],
    "property_type": propertyTypeValues.reverse[propertyType],
    "size": size,
    "size_type": sizeTypeValues.reverse[sizeType],
    "summary": summary,
    "thumb_height": thumbHeight,
    "thumb_url": thumbUrl,
    "thumb_width": thumbWidth,
    "title": title,
    "updated_in_days": updatedInDays,
    "updated_in_days_formatted": updatedInDaysFormattedValues.reverse[updatedInDaysFormatted],
    "lister_name": listerName == null ? null : listerName,
  };
}

enum DatasourceName { MOUSEPRICE, HOME_CO_UK, NET_HOUSE_PRICES }

final datasourceNameValues = EnumValues({
  "Home.co.uk": DatasourceName.HOME_CO_UK,
  "Mouseprice": DatasourceName.MOUSEPRICE,
  "NetHousePrices": DatasourceName.NET_HOUSE_PRICES
});

enum PriceCurrency { EMPTY }

final priceCurrencyValues = EnumValues({
  "£": PriceCurrency.EMPTY
});

enum PriceType { FIXED }

final priceTypeValues = EnumValues({
  "fixed": PriceType.FIXED
});

enum PropertyType { HOUSE, FLAT }

final propertyTypeValues = EnumValues({
  "flat": PropertyType.FLAT,
  "house": PropertyType.HOUSE
});

enum UpdatedInDaysFormatted { NEW, FIRST_SEEN_YESTERDAY, FIRST_SEEN_2_DAYS_AGO, FIRST_SEEN_3_DAYS_AGO }

final updatedInDaysFormattedValues = EnumValues({
  "first seen 2 days ago": UpdatedInDaysFormatted.FIRST_SEEN_2_DAYS_AGO,
  "first seen 3 days ago": UpdatedInDaysFormatted.FIRST_SEEN_3_DAYS_AGO,
  "first seen yesterday": UpdatedInDaysFormatted.FIRST_SEEN_YESTERDAY,
  "New": UpdatedInDaysFormatted.NEW
});

class Location {
  double centerLat;
  double centerLong;
  String longTitle;
  String placeName;
  String title;

  Location({
    @required this.centerLat,
    @required this.centerLong,
    @required this.longTitle,
    @required this.placeName,
    @required this.title,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    centerLat: json["center_lat"].toDouble(),
    centerLong: json["center_long"].toDouble(),
    longTitle: json["long_title"],
    placeName: json["place_name"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "center_lat": centerLat,
    "center_long": centerLong,
    "long_title": longTitle,
    "place_name": placeName,
    "title": title,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
