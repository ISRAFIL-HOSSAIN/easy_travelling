import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
    CityModel({
        this.errorCode,
        this.errorMsg,
        this.data,
        this.data2,
    });

    String? errorCode;
    String? errorMsg;
    List<Datum>? data;
    List<Data2>? data2;

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        errorCode: json["errorCode"],
        errorMsg: json["errorMsg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        data2: List<Data2>.from(json["data2"].map((x) => Data2.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMsg": errorMsg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "data2": List<dynamic>.from(data2!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.image,
        this.description,
        this.address,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.status,
        this.cityId,
        this.type,
        this.website,
    });

    int? id;
    String? name;
    String? image;
    String? description;
    String? address;
    String? latitude;
    String? longitude;
    String? createdAt;
    int? status;
    int? cityId;
    int? type;
    String? website;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: json["created_at"],
        status: json["status"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        type: json["type"] == null ? null : json["type"],
        website: json["website"] == null ? null : json["website"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt,
        "status": status,
        "city_id": cityId == null ? null : cityId,
        "type": type == null ? null : type,
        "website": website == null ? null : website,
    };
}

class Data2 {
    Data2({
        this.parking,
        this.overview,
        this.bood,
        this.activity,
        this.event,
    });

    List<Datum>? parking;
    List<Datum>? overview;
    List<Datum>? bood;
    List<dynamic>? activity;
    List<dynamic>? event;

    factory Data2.fromJson(Map<String, dynamic> json) => Data2(
        parking: List<Datum>.from(json["parking"].map((x) => Datum.fromJson(x))),
        overview: List<Datum>.from(json["overview"].map((x) => Datum.fromJson(x))),
        bood: List<Datum>.from(json["bood"].map((x) => Datum.fromJson(x))),
        activity: List<dynamic>.from(json["activity"].map((x) => x)),
        event: List<dynamic>.from(json["event"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "parking": List<dynamic>.from(parking!.map((x) => x.toJson())),
        "overview": List<dynamic>.from(overview!.map((x) => x.toJson())),
        "bood": List<dynamic>.from(bood!.map((x) => x.toJson())),
        "activity": List<dynamic>.from(activity!.map((x) => x)),
        "event": List<dynamic>.from(event!.map((x) => x)),
    };
}
