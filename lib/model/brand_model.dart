// To parse this JSON data, do
//
//     final welcomeSuccess = welcomeSuccessFromJson(jsonString);

import 'dart:convert';

WelcomeSuccess welcomeSuccessFromJson(String str) => WelcomeSuccess.fromJson(json.decode(str));

String welcomeSuccessToJson(WelcomeSuccess data) => json.encode(data.toJson());

class WelcomeSuccess {
    Collection collection;
    List<Datum> data;

    WelcomeSuccess({
        required this.collection,
        required this.data,
    });

    factory WelcomeSuccess.fromJson(Map<String, dynamic> json) => WelcomeSuccess(
        collection: Collection.fromJson(json["collection"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
    int id;
    int makeId;
    String name;
    Make make;

    Datum({
        required this.id,
        required this.makeId,
        required this.name,
        required this.make,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        makeId: json["make_id"],
        name: json["name"],
        make: Make.fromJson(json["make"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "make_id": makeId,
        "name": name,
        "make": make.toJson(),
    };
}

class Make {
    int id;
    String name;

    Make({
        required this.id,
        required this.name,
    });

    factory Make.fromJson(Map<String, dynamic> json) => Make(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}


