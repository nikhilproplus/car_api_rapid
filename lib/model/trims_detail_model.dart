// To parse this JSON data, do
//
//     final welcomeSuccess4 = welcomeSuccess4FromJson(jsonString);

import 'dart:convert';

WelcomeSuccess4 welcomeSuccess4FromJson(String str) => WelcomeSuccess4.fromJson(json.decode(str));

String welcomeSuccess4ToJson(WelcomeSuccess4 data) => json.encode(data.toJson());

class WelcomeSuccess4 {
    Collection collection;
    List<Datum4> data;

    WelcomeSuccess4({
        required this.collection,
        required this.data,
    });

    factory WelcomeSuccess4.fromJson(Map<String, dynamic> json) => WelcomeSuccess4(
        collection: Collection.fromJson(json["collection"]),
        data: List<Datum4>.from(json["data"].map((x) => Datum4.fromJson(x))),
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

class Datum4 {
    int id;
    int makeModel4Id;
    int year;
    String name;
    String description;
    int msrp;
    int invoice;
    DateTime created;
    DateTime modified;
    MakeModel4 makeModel4;

    Datum4({
        required this.id,
        required this.makeModel4Id,
        required this.year,
        required this.name,
        required this.description,
        required this.msrp,
        required this.invoice,
        required this.created,
        required this.modified,
        required this.makeModel4,
    });

    factory Datum4.fromJson(Map<String, dynamic> json) => Datum4(
        id: json["id"],
        makeModel4Id: json["make_model_id"],
        year: json["year"],
        name: json["name"],
        description: json["description"],
        msrp: json["msrp"],
        invoice: json["invoice"],
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
        makeModel4: MakeModel4.fromJson(json["make_model"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "make_model_id": makeModel4Id,
        "year": year,
        "name": name,
        "description": description,
        "msrp": msrp,
        "invoice": invoice,
        "created": created.toIso8601String(),
        "modified": modified.toIso8601String(),
        "make_model": makeModel4.toJson(),
    };
}

class MakeModel4 {
    int id;
    int makeId;
    String name;
    Make4 make;

    MakeModel4({
        required this.id,
        required this.makeId,
        required this.name,
        required this.make,
    });

    factory MakeModel4.fromJson(Map<String, dynamic> json) => MakeModel4(
        id: json["id"],
        makeId: json["make_id"],
        name: json["name"],
        make: Make4.fromJson(json["make"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "make_id": makeId,
        "name": name,
        "make": make.toJson(),
    };
}

class Make4 {
    int id;
    String name;

    Make4({
        required this.id,
        required this.name,
    });

    factory Make4.fromJson(Map<String, dynamic> json) => Make4(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}



