

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './button.dart';
import './carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Turgunboev Abdumuxtor,
//Bugun 24-sentabr,soat 23:01, 7 soat avval GDG DevFest App Hackatonga start berildi,o'z ishimni boshladim

void main() {
  runApp(Gdg());
}

class Gdg extends StatefulWidget {
  @override
  _GdgState createState() => _GdgState();
}

class _GdgState extends State<Gdg> {



  var buttonTexts = {
    'Agenda',
    'Speakers',
    'Team',
    'Sponsors',
    'FAQ',
    'Locate Us',
};

var icons = <Widget>[
Icon(Icons.calendar_today,color: Colors.red[800],size: 20,),
Icon(Icons.person,color: Colors.yellow[800],size: 20,),
Icon(Icons.group,color: Colors.black45,size: 20,),
Icon(Icons.attach_money,color: Colors.green[800],size: 20,),
Icon(Icons.info,color: Colors.blue[800],size: 20,),
Icon(Icons.location_searching,color: Colors.grey[800],size: 20,),



];


  

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(


      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white70,
        leading: Icon(Icons.menu,color: Colors.black,),),
        backgroundColor: Colors.grey[400],
        body: Column(
          children: [
            Carousel(),
            


            Container(margin: EdgeInsets.only(top:50),
              child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children:[
               
             
                Container(child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    //tugmalar ro'yhati button.dart fayliga yuborilyapti
                    Button(buttonTexts.elementAt(0),icons.elementAt(0), ),
                   
                    Button(buttonTexts.elementAt(1),icons.elementAt(1),
                  ),
                 
                    Button(buttonTexts.elementAt(2),icons.elementAt(2),
                    )]
                ),),
                Container(margin: EdgeInsets.only(top:30),child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(buttonTexts.elementAt(3),icons.elementAt(3),),
             
                    Button(buttonTexts.elementAt(4),icons.elementAt(4),),
                  
                    Button(buttonTexts.elementAt(5),icons.elementAt(5),)
                  //tugmalar tugadi
                  
                  ]),
                ),



                    
                    
                    
                    Container(margin:EdgeInsets.only(top:80),child:
                    Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children:  <Widget>[
   IconButton(color: Colors.black,iconSize: 20,icon: FaIcon(FontAwesomeIcons.meetup), onPressed: ()=>launch('https://www.meetup.com/GDG-Tashkent/events/263696235/')),
   IconButton(color: Colors.black,iconSize: 20,icon: FaIcon(FontAwesomeIcons.facebookF), onPressed: ()=> launch('https://www.facebook.com/gdgtashkent/')),
   IconButton(color: Colors.black,iconSize: 20,icon: FaIcon(FontAwesomeIcons.twitter), onPressed: ()=> launch('https://twitter.com/gdgtashkent/')),
   IconButton(color: Colors.black,iconSize: 20,icon: FaIcon(FontAwesomeIcons.instagram), onPressed: ()=> launch('https://www.instagram.com/gdgtashkent')),

     
   

  ],
))
            ]
              )
            
              )
            
            
            
            
            
            
            
            ],
        ),
        )

      );
    
  }

  

  
}

