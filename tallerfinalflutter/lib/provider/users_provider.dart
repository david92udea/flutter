import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tallerfinalflutter/models/models.dart';

class UsersProvider extends ChangeNotifier {

  final String _baseURL =  'jsonplaceholder.typicode.com';

  List<User> usersList = [];
  UsersList uList;

  final String _segmento = '/users';

  UsersProvider(){

    getUsers();
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

  getUsers() async{
    
    final respuestaJSON = await _obtenerDataDeJSON(_segmento);
    uList = UsersList.fromJson(json.decode(respuestaJSON));
    for(int i=0; i<uList.users.length; i++){
      usersList.add(uList.users[i]);
    }
    
    notifyListeners();
  }
}
