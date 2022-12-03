import 'package:flutter/material.dart';
import 'package:tallerfinalflutter/models/models.dart';

class PhotoSlider extends StatefulWidget {
  
  const PhotoSlider({Key key, this.photos, this.titulo}) : super(key: key);
  final List<Photo> photos;
  final String titulo;

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {

  @override
  void initState() {

    super.initState();
 
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //* para que tome todo el ancho posible
      height: 260,
      child: Column(
        children: [
          if(widget.titulo != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.titulo,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.photos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _PhotoPoster(
                photo: widget.photos[index], 
                idPhoto: '${widget.titulo}-$index-${widget.photos[index].id}'),
              )
          )
        ],
        )
    );
  }
}

class _PhotoPoster extends StatelessWidget {
  const _PhotoPoster({Key key, this.photo, this.idPhoto}) : super(key: key);
  final Photo photo;
  final String idPhoto;
  @override
  Widget build(BuildContext context) {
    photo.idPhoto = idPhoto;
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'detalle', arguments: photo),
            child: Hero(
              tag: photo.idPhoto,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('${photo.url}.jpg'),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover
                ),
              ),
            ),
          ),
          Text(
            photo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white)
          ),
        ],)
    );
  }
}