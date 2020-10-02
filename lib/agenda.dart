import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import './list.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  List<Lists> alldata = [];
  List<SpeakersAgenda> exdata=[];
  @override
  void initState() {
    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    String sessions ='sessions';
    ref.child(sessions).once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      alldata.clear();
      for (var key in keys) {
        List<dynamic> speakers = data[key]['speakers'];
        String nameOfTheSpeaker = ''; //ism chiqmadi//chiqdi aka)) endi yahshi ishladimi?ha zo'r menga kereli narsani oldim)) ishlarizga omad!rahmat aka )) sog bulin man teams dan chiqyapman.ok tg
        if(speakers != null){
          nameOfTheSpeaker = speakers[0];
        }
        
       
        Lists newList = new Lists(
          title: data[key]['title'],
          presentation1: data[key]['presentation'],
          name: nameOfTheSpeaker, 
          

        );
        alldata.add(newList);
         }setState(() {
       }); }
     );


ref.child('speakers').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
    exdata.clear();
    
      for (var key in keys) {
        SpeakersAgenda newList2 = new SpeakersAgenda(
         agendaName: data[key]['name'],
         agendaImage: data[key]['photoUrl'],
         agendaJob: data[key]['title'],
     
        );
      exdata.add(newList2);
      
      }

      setState(() {});
    });

  
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Container(margin: EdgeInsets.only(left:85),child:Text('Agenda')),),
      body: Container(
          child: alldata.length+exdata.length == 0
              ? new Container(color:Colors.grey[400],child:Center(child: Text('Loading...')))
              : new ListView.builder(
                itemCount: exdata.length,
                  itemBuilder: (_, index) {
                    return UI( 
                        alldata[index].title,
                        alldata[index].presentation1,
                        alldata[index].name,
                         exdata[index].agendaName,
                         exdata[index].agendaImage,
                         exdata[index].agendaJob
                        );
                  },
                  
                )),
    );
  }

   Widget UI(String title1, String presentation,String name,String spName,String spImage,String spJob) {
    return 
       Container(color: Colors.grey[400],
        height: 150,
        child: Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
               spImage,
                width: 140,
                height: 120,
              )),
         
                       Flexible(
                                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 title1 == null ?  Container(child: Text("No  title")) : Expanded(flex:1,child: Container(margin: EdgeInsets.only(left: 15,top:10,right: 20),child:Text( title1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),))),
               spName == null ?  Container(child: Text("No name")) : Expanded(flex:1,child: Container(margin: EdgeInsets.only(right:15,bottom: 40),child:Text(spName,style: TextStyle(color: Colors.white54,fontSize: 13,fontWeight: FontWeight.w500 ),))),
            
                 
                       
                                                 
                       
                    
              ],
            ),
                       ),
          
        ]),
      );
    
  }
}
