import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import './card1.dart';


class Carousel extends StatefulWidget {
  
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
int _currentIndex = 0;
  List cardList = [Card1(), Card1(), Card1(), Card1()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
          return    Column(children:[ 
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
                        margin:
                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ]


   
          ]);
    
        
 
  }
}