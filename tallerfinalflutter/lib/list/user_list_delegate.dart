import 'package:flutter/material.dart';
import 'package:tallerfinalflutter/models/models.dart';

class UserItem extends StatelessWidget {
  const UserItem({Key key, this.user}) : super(key: key);

  //final List<User> users;
  final User user;

  @override
  Widget build(BuildContext context) {
    user.idUser = 'list-${user.id}';
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      //onTap: ()=> Navigator.pushNamed(context,'detalleUsuarios',arguments: user),
    );
  }
}