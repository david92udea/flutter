import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tallerfinalflutter/models/models.dart';

class SwiperPhotoContainer extends StatelessWidget {
  
  SwiperPhotoContainer({Key key, this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {

    final tamano = MediaQuery.of(context).size;

    if(photos.isEmpty){
      return SizedBox(
        width: double.infinity,
        height: tamano.height*0.5,
        child: Center(
          child: CircularProgressIndicator()
        )
      );
    }
    return SizedBox(
      width: double.infinity,
      height: tamano.height * 0.5,
      child: Swiper(
        itemCount: photos.length,
        layout: SwiperLayout.STACK,
        itemHeight: tamano.height*0.42,
        itemWidth: tamano.width*0.77,
        itemBuilder: (context, index) {
          final photo = photos[index];
          photo.idPhoto = 'swiper-${photo.id}';
          return GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'detalle', arguments: photo),
            child: Hero(
              tag: photo.idPhoto,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('${photo.url}.jpg'),
                  fit: BoxFit.fill
                )
              ),
            ),
          );
        },
      )
    );
  }
}