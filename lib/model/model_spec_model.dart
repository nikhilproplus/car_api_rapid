// To parse this JSON data, do
//
//     final welcomeSuccess3 = welcomeSuccess3FromJson(jsonString);

import 'dart:convert';

WelcomeSuccess3 welcomeSuccess3FromJson(String str) =>
    WelcomeSuccess3.fromJson(json.decode(str));

String welcomeSuccess3ToJson(WelcomeSuccess3 data) =>
    json.encode(data.toJson());

class WelcomeSuccess3 {
  Collection collection;
  List<Datum3> data;

  WelcomeSuccess3({
    required this.collection,
    required this.data,
  });

  factory WelcomeSuccess3.fromJson(Map<String, dynamic> json) =>
      WelcomeSuccess3(
        collection: Collection.fromJson(json["collection"]),
        data: List<Datum3>.from(json["data"].map((x) => Datum3.fromJson(x))),
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

class Datum3 {
  int id;
  int makeModelTrimId;
  String engineType;
  String fuelType;
  String cylinders;
  String size;
  int horsepowerHp;
  int horsepowerRpm;
  int torqueFtLbs;
  int torqueRpm;
  int valves;
  String valveTiming;
  String camType;
  String driveType;
  String transmission;
  MakeModelTrim makeModelTrim;

  Datum3({
    required this.id,
    required this.makeModelTrimId,
    required this.engineType,
    required this.fuelType,
    required this.cylinders,
    required this.size,
    required this.horsepowerHp,
    required this.horsepowerRpm,
    required this.torqueFtLbs,
    required this.torqueRpm,
    required this.valves,
    required this.valveTiming,
    required this.camType,
    required this.driveType,
    required this.transmission,
    required this.makeModelTrim,
  });

  factory Datum3.fromJson(Map<String, dynamic> json) => Datum3(
        id: json["id"],
        makeModelTrimId: json["make_model_trim_id"],
        engineType: json["engine_type"],
        fuelType: json["fuel_type"],
        cylinders: json["cylinders"],
        size: json["size"],
        horsepowerHp: json["horsepower_hp"],
        horsepowerRpm: json["horsepower_rpm"],
        torqueFtLbs: json["torque_ft_lbs"],
        torqueRpm: json["torque_rpm"],
        valves: json["valves"],
        valveTiming: json["valve_timing"] ?? 'not available',
        camType: json["cam_type"],
        driveType: json["drive_type"],
        transmission: json["transmission"],
        makeModelTrim: MakeModelTrim.fromJson(json["make_model_trim"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "make_model_trim_id": makeModelTrimId,
        "engine_type": engineType,
        "fuel_type": fuelType,
        "cylinders": cylinders,
        "size": size,
        "horsepower_hp": horsepowerHp,
        "horsepower_rpm": horsepowerRpm,
        "torque_ft_lbs": torqueFtLbs,
        "torque_rpm": torqueRpm,
        "valves": valves,
        "valve_timing": valveTiming,
        "cam_type": camType,
        "drive_type": driveType,
        "transmission": transmission,
        "make_model_trim": makeModelTrim.toJson(),
      };
}

class MakeModelTrim {
  int id;
  int makeModelId;
  int year;
  String name;
  String description;
  int msrp;
  int invoice;
  DateTime created;
  DateTime modified;
  MakeModel makeModel;

  MakeModelTrim({
    required this.id,
    required this.makeModelId,
    required this.year,
    required this.name,
    required this.description,
    required this.msrp,
    required this.invoice,
    required this.created,
    required this.modified,
    required this.makeModel,
  });

  factory MakeModelTrim.fromJson(Map<String, dynamic> json) => MakeModelTrim(
        id: json["id"],
        makeModelId: json["make_model_id"],
        year: json["year"],
        name: json["name"],
        description: json["description"],
        msrp: json["msrp"],
        invoice: json["invoice"],
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
        makeModel: MakeModel.fromJson(json["make_model"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "make_model_id": makeModelId,
        "year": year,
        "name": name,
        "description": description,
        "msrp": msrp,
        "invoice": invoice,
        "created": created.toIso8601String(),
        "modified": modified.toIso8601String(),
        "make_model": makeModel.toJson(),
      };
}

class MakeModel {
  int id;
  int makeId;
  String name;
  Make make;

  MakeModel({
    required this.id,
    required this.makeId,
    required this.name,
    required this.make,
  });

  factory MakeModel.fromJson(Map<String, dynamic> json) => MakeModel(
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
