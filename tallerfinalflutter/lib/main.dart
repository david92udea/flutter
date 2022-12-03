import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tallerfinalflutter/pages/pages.dart';
import 'package:tallerfinalflutter/provider/provider.dart';
import 'package:tallerfinalflutter/provider/users_provider.dart';

void main() {
  //*runApp(const MyApp());
  runApp(const AppState());

}

class AppState extends StatelessWidget {
 
  const AppState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => PhotosProvider(),lazy: false),
    ],
    child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'principal',
      routes: {
       
        'principal': (context) => HomePage(),
        'detalle': (context) => DetailPage(),
        'usuarios': (context) => UserPage(),
       // 'detalleUsuarios': (context) => DetalleUsuarios(),
      },
      theme: ThemeData(
      
        primaryColor: Colors.black
      ),
    );
  }
}
