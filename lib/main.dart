

import 'package:flutter/material.dart';
import './button.dart';
import './carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import './speakers.dart';
import './members_screen.dart';
import 'agenda.dart';

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
IconButton(color: Colors.red[800],icon: FaIcon(FontAwesomeIcons.calendarAlt),onPressed: null,),
IconButton(color: Colors.grey[500],icon: FaIcon(FontAwesomeIcons.userAlt), onPressed: ()=> print('hello')),
IconButton(color:Colors.black54,icon: FaIcon(FontAwesomeIcons.users), onPressed: ()=> print('hello')),
IconButton(color: Colors.green,icon: FaIcon(FontAwesomeIcons.handHoldingUsd), onPressed: ()=> print('hello')),
IconButton(icon: FaIcon(FontAwesomeIcons.questionCircle), onPressed: null),
IconButton(icon: FaIcon(FontAwesomeIcons.mapMarkedAlt), onPressed: null)



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
   IconButton(color: Colors.black,iconSize: 20,icon: FaIcon(FontAwesomeIcons.youtube), onPressed: null,),
   IconButton(color: Colors.black,iconSize: 20,icon: FaIcon(FontAwesomeIcons.facebookF), onPressed: ()=> print('hello')),
   IconButton(color: Colors.black,iconSize: 20,icon: FaIcon(FontAwesomeIcons.telegram), onPressed: ()=> print('hello')),
   IconButton(color: Colors.black,iconSize: 20,icon: FaIcon(FontAwesomeIcons.instagram), onPressed: ()=> print('hello')),

     
   

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

