import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tallerfinalflutter/models/models.dart';

class ListUserContainer extends StatelessWidget {
  
  ListUserContainer({Key key, this.users}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {

    final tamano = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: tamano.height * 0.5,
      child: Swiper(
        itemCount: users.length,
        layout: SwiperLayout.STACK,
        itemHeight: tamano.height*0.42,
        itemWidth: tamano.width*0.77,
        itemBuilder: (context, index) {
          final user = users[index];
          user.idUser = 'swiper-${user.id}';
          return GestureDetector(
            //onTap: ()=> Navigator.pushNamed(context, 'detalle', arguments: user),
            child: Hero(
              tag: user.idUser,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Text(user.email),
                /*child: FadeInImage(
                  //placeholder: const AssetImage('assets/no-image.jpg'),
                  //image: NetworkImage('${user.email}.jpg'),
                  fit: BoxFit.fill
                )*/
              ),
            ),
          );
        },
      )
    );
  }
}