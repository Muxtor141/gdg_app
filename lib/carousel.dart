import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './card1.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var images = {
    'https://xabar.uz/static/crop/4/2/920__95_4201638091.jpeg',
    'https://i.ytimg.com/vi/-FeP_RXyiOc/maxresdefault.jpg',
    'https://secure.meetupstatic.com/photos/event/b/0/d/8/600_468525272.jpeg',
    'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_500,q_auto:good,w_500/v1/gcs/platform-data-goog/event_banners/GDG-Website-EventThumbnail-03.png'
  };

  int _currentIndex = 0;
  List cardList = [
    Card1(
      'https://xabar.uz/static/crop/4/2/920__95_4201638091.jpeg',
      ()=>
launch('https://gdgtashkent.co/')

        
    ),
    Card1('https://i.ytimg.com/vi/-FeP_RXyiOc/maxresdefault.jpg',
  ()=>
launch('https://gdgtashkent.co/')

        ),
    Card1(
        'https://secure.meetupstatic.com/photos/event/b/0/d/8/600_468525272.jpeg',
        ()=>
launch('https://gdgtashkent.co/')

        ),
    Card1(
        'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_500,q_auto:good,w_500/v1/gcs/platform-data-goog/event_banners/GDG-Website-EventThumbnail-03.png',
        (()=>
launch('https://gdg.community.dev/')

        )
        )
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...<Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 140.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.white,
                  child: card,
                ),
              );
            });
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(cardList, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
              ),
            );
          }),
        ),
      ]
    ]);
  }
}
