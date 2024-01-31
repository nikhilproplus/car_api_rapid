// To parse this JSON data, do
//
//     final welcomeSuccess2 = welcomeSuccess2FromJson(jsonString);

import 'dart:convert';

WelcomeSuccess2 welcomeSuccess2FromJson(String str) =>
    WelcomeSuccess2.fromJson(json.decode(str));

String welcomeSuccess2ToJson(WelcomeSuccess2 data) =>
    json.encode(data.toJson());

class WelcomeSuccess2 {
  Collection collection;
  List<Datum2> data;

  WelcomeSuccess2({
    required this.collection,
    required this.data,
  });

  factory WelcomeSuccess2.fromJson(Map<String, dynamic> json) =>
      WelcomeSuccess2(
        collection: Collection.fromJson(json["collection"]),
        data: List<Datum2>.from(json["data"].map((x) => Datum2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "collection": collection.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Collection {
  String url;
  int count;
  int pages;
  int total;
  String next;
  String prev;
  String first;
  String last;

  Collection({
    required this.url,
    required this.count,
    required this.pages,
    required this.total,
    required this.next,
    required this.prev,
    required this.first,
    required this.last,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        url: json["url"],
        count: json["count"],
        pages: json["pages"],
        total: json["total"],
        next: json["next"],
        prev: json["prev"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "count": count,
        "pages": pages,
        "total": total,
        "next": next,
        "prev": prev,
        "first": first,
        "last": last,
      };
}

class Datum2 {
  int id;
  String name;

  Datum2({
    required this.id,
    required this.name,
  });

  factory Datum2.fromJson(Map<String, dynamic> json) => Datum2(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
