
import 'dart:convert';

RouteModel routeModelFromJson(String str) => RouteModel.fromJson(json.decode(str));

String routeModelToJson(RouteModel data) => json.encode(data.toJson());

class RouteModel {
    RouteModel({
        this.errorCode,
        this.errorMsg,
        this.data,
    });

    String? errorCode;
    String? errorMsg;
    List<RouteAllData>? data;

    factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
        errorCode: json["errorCode"],
        errorMsg: json["errorMsg"],
        data: List<RouteAllData>.from(json["data"].map((x) => RouteAllData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMsg": errorMsg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class RouteAllData {
    RouteAllData({
        this.id,
        this.name,
        this.image,
        this.description,
        this.address,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.status,
        this.city,
    });

    int ?id;
    String ?name;
    String ?image;
    String ?description;
    String? address;
    String? latitude;
    String? longitude;
    String? createdAt;
    int? status;
    List<RouteAllData>? city;

    factory RouteAllData.fromJson(Map<String, dynamic> json) => RouteAllData(
        id: json["id"],
        name: json["name"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        createdAt: json["created_at"],
        status: json["status"],
        city: json["city"] == null ? null : List<RouteAllData>.from(json["city"].map((x) => RouteAllData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image == null ? null : image,
        "description": description == null ? null : description,
        "address": address == null ? null : address,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "created_at": createdAt,
        "status": status,
        "city": city == null ? null : List<dynamic>.from(city!.map((x) => x.toJson())),
    };
}
