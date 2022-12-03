import 'package:flutter/material.dart';


class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  Widget build(BuildContext context) {

    //final getUserProvider = Provider.of<UsersProvider>(context, listen: true);
  
   return Scaffold(
      appBar: AppBar(),
      body:  SafeArea(child: OrientationBuilder(
        builder: (context, orientation) {
          final lista = ListView.builder(
            //key: listKey,
            itemBuilder: (context, index) {
              return ListTile(title: Text('$index'));
            },
            itemCount: 1000,
          );
          if(orientation == Orientation.portrait){
            return Column(children: [
              const SizedBox(height: 10),
              const Text('Users:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Expanded(
                child: lista
              )
            ],
            );
          }   
          return Row(
            children: [
              Expanded(child: Text('Users', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              Expanded(child: lista)
          ],
        );   
        }
        
      ))
    );
  }
}