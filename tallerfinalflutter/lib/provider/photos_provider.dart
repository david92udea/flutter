import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tallerfinalflutter/models/models.dart';

class PhotosProvider extends ChangeNotifier {

  final String _baseURL =  'jsonplaceholder.typicode.com';

  List<Photo> photosList = [];
  PhotosList pList;

  final String _segmento = '/photos';

  PhotosProvider(){

    getPhotos();
  }

  Future<String> _obtenerDataDeJSON(String segmentoURL) async {

    final url = Uri.https(_baseURL, segmentoURL);
    final respuesta = await http.get(url);

    if(respuesta.statusCode != 200){
      print(respuesta.statusCode);
      return 'error en la petición';
    }
    return respuesta.body;
  }

  getPhotos() async{
    
    final respuestaJSON = await _obtenerDataDeJSON(_segmento);
    pList = PhotosList.fromJson(json.decode(respuestaJSON));
    for(int i=0; i<pList.photos.length; i++){
      photosList.add(pList.photos[i]);
    }
    
    notifyListeners();
  }
}
