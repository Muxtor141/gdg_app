import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  String url;
  Function clicker;
  Card1(this.url,this.clicker);
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: Border.all(color: Colors.white54),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
   
        return InkWell(
                  child: Container(
           decoration: myBoxDecoration(),
            child:    url ==null?Center(child:Text('No internet')): Image.network(url,fit: BoxFit.cover,)
        
            ),
          
          

          onTap: ()=>launch('https://gdgtashkent.co/'),
        );
     
  }
}
