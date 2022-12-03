// To parse this JSON data, do
//
//     final charactersResponse = charactersResponseFromMap(jsonString);

import 'dart:convert';
import 'package:tallerfinalflutter/models/user.dart';

class SearchCharacters {

    SearchCharacters({
        this.results,
    });

    //Info info;
    List<User> results;

    factory SearchCharacters.fromJson(String str) => SearchCharacters.fromMap(json.decode(str));

    factory SearchCharacters.fromMap(Map<String, dynamic> json) => SearchCharacters(
       // info: Info.fromMap(json["info"]),
        results: List<User>.from(json["results"].map((x) => User.fromMap(x))),
    );
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
