import 'package:flutter/material.dart';
import 'package:tallerfinalflutter/models/models.dart';

class DetailPage extends StatelessWidget {

  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* recuperar el argumento de la ruta
    final Photo photo = ModalRoute.of(context).settings.arguments as Photo;
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _BarraPersonalizada(photo: photo),
          SliverList(
            delegate: SliverChildListDelegate([
                _PosterYTitulo(photo),
                _TextoDetalle(),
                _TextoDetalle(),
                _TextoDetalle(),
                _TextoDetalle(),
                _TextoDetalle(),
              ]
            )
          )
        ]
      )
    );
  }
}

class _BarraPersonalizada extends StatelessWidget {
  
  const _BarraPersonalizada({Key key, this.photo}) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
  
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 58, 61, 78),
      expandedHeight: 200,
      pinned: true, 
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(
            photo.title, 
            style: 
              const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
          )
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage('${photo.url}.jpg'),
          fit: BoxFit.cover
        ),
      ),
      
    );
  }
}

class _PosterYTitulo extends StatelessWidget {
  const _PosterYTitulo(this.photo,{Key key}) : super(key: key);
  final Photo photo;

  @override
  Widget build(BuildContext context) {

    final tamano = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Hero(
          tag: photo,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('${photo.url}.jpg'),
              width: 150,
              height: 150,
              fit: BoxFit.cover
            )
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            ConstrainedBox(
                constraints: BoxConstraints(maxWidth: tamano.width - 170) ,
                child: Text(
                  'Photo Id: ${photo.id}',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                  overflow: TextOverflow.ellipsis, 
                  maxLines: 2
                )
              ),
           
            Text('Album Id: ${photo.albumId}', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white), overflow: TextOverflow.ellipsis,maxLines: 4),
            Row(
              children: [
                Icon(Icons.photo_album_outlined,size: 20, color:Colors.blue),
                Text('Unique ID: ${photo.idPhoto}', textAlign: TextAlign.justify,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),overflow: TextOverflow.ellipsis,maxLines: 4)
              ])
          ])
      ]),

    );
  }
}

class _TextoDetalle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: const Text(
        "Cupidatat velit cupidatat dolor minim. Labore officia laboris commodo minim irure sit dolor est nulla magna aute pariatur velit. Labore voluptate proident pariatur tempor eiusmod anim in ipsum laborum veniam minim sit.",
        textAlign: TextAlign.justify, style: TextStyle(color: Colors.white),
        ),
    );
  }
}