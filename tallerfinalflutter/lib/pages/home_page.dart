
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tallerfinalflutter/pages/pages.dart';
import 'package:tallerfinalflutter/provider/provider.dart';
import 'package:tallerfinalflutter/widgets/widgets.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getPhotoProvider = Provider.of<PhotosProvider>(context, listen: true);
  
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: ListView(
    // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
               height: 100,
              child: const DrawerHeader(
              
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  
                ),
                child: Text('Options: '),
              ),
            ),
            ListTile(
              title: const Text('Users'),
              onTap: () {
                final usersRoute = MaterialPageRoute(
                  builder: (context) => UserPage(),
                );
                Navigator.push(context, usersRoute);
              },
            ),
  
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("App Photos",style: TextStyle(fontSize: 30)),
        elevation:50,
        shadowColor: Colors.redAccent,
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwiperPhotoContainer(photos: getPhotoProvider.photosList),
            PhotoSlider(
              photos: getPhotoProvider.photosList,
              titulo: 'Photos List', 
              )
          ],
        )
      )
    );

  }
}