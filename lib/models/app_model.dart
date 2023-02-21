// To parse this JSON data, do
//
//     final appconfig = appconfigFromJson(jsonString);

import 'dart:convert';

Appconfig appconfigFromJson(String str) => Appconfig.fromJson(json.decode(str));

String appconfigToJson(Appconfig data) => json.encode(data.toJson());

class Appconfig {
    Appconfig({
        required this.splashlogo,
        required this.applogo,
        required this.walkthrogh,
    });

    List<Logo> splashlogo;
    List<Logo> applogo;
    List<Walkthrogh> walkthrogh;

    factory Appconfig.fromJson(Map<String, dynamic> json) => Appconfig(
        splashlogo: List<Logo>.from(json["splashlogo"].map((x) => Logo.fromJson(x))),
        applogo: List<Logo>.from(json["applogo"].map((x) => Logo.fromJson(x))),
        walkthrogh: List<Walkthrogh>.from(json["walkthrogh"].map((x) => Walkthrogh.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "splashlogo": List<dynamic>.from(splashlogo.map((x) => x.toJson())),
        "applogo": List<dynamic>.from(applogo.map((x) => x.toJson())),
        "walkthrogh": List<dynamic>.from(walkthrogh.map((x) => x.toJson())),
    };
}

class Logo {
    Logo({
        required this.image,
    });

    String image;

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
    };
}

class Walkthrogh {
    Walkthrogh({
        required this.title,
        required this.description,
        required this.image,
    });

    String title;
    String description;
    String image;

    factory Walkthrogh.fromJson(Map<String, dynamic> json) => Walkthrogh(
        title: json["title"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image": image,
    };
}
