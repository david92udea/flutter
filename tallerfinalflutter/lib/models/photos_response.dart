
import 'dart:convert';
import 'package:tallerfinalflutter/models/models.dart';

class PhotosResponse {
    PhotosResponse({
        this.results,
    });

    List<Photo> results;

    factory PhotosResponse.fromJson(String str) => PhotosResponse.fromMap(json.decode(str));

    factory PhotosResponse.tolist(String str) => PhotosResponse.slista(json.decode(str)); 

    factory PhotosResponse.fromMap(Map<String, dynamic> json) => PhotosResponse(

        results: List<Photo>.from(json["results"].map((x) => Photo.fromMap(x))),
    );

    factory PhotosResponse.slista(Map<String, dynamic> json) => PhotosResponse(

        results: List<Photo>.from(json["results"].map((x) => Photo.fromMap(x[0]))),
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
