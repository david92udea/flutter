
class PhotosList {
  final List<Photo> photos;

  PhotosList({
    this.photos,
});

  factory PhotosList.fromJson(List<dynamic> parsedJson) {

    List<Photo> photos ;
    photos = parsedJson.map((i)=>Photo.fromJson(i)).toList();

    return new PhotosList(
      photos: photos
    );
  }
}

class Photo {
    Photo({
        this.albumId,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl,
    });

    String albumId;
    String id;
    String title;
    String url;
    String thumbnailUrl;

    String idPhoto;

    factory Photo.fromJson(Map<String, dynamic> json){
    return new Photo(
      albumId: json['albumId'].toString(),
      id: json['id'].toString(),
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],

    );
  }

    factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );
}
