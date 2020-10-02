import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gdg_app/list.dart';


class Speaker extends StatefulWidget {
  @override
  _SpeakerState createState() => _SpeakerState();
}

class _SpeakerState extends State<Speaker> {
  List<Speakers> alldata = [];
  @override
  void initState() {
    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    String speakers = 'speakers';
    ref.child(speakers).once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      alldata.clear();
      for (var key in keys) {
        Speakers newList1 = new Speakers(
          data[key]['name'],
          data[key]['photoUrl'],
          data[key]['title'],
          data[key]['country'],
          data[key]['shortBio']
        );
        print(data);
        alldata.add(newList1);
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Speakers',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.grey[400],
      ),
      body: Container(color: Colors.white,
          child: alldata.length == 0
              ? new Container(color:Colors.grey[400],child: Center(child: Text('Loading...')))
              : new ListView.builder(
                  itemCount: alldata.length,
                  itemBuilder: (_, index) {
                    return UI(
                      alldata[index].speakerName,
                      alldata[index].speakerImage,
                      alldata[index].speakerJob,
                      alldata[index].speakerCountry,
                      alldata[index].speakerBio,
                    );
                  },
                )),
    );
  }

  Widget UI(String name, String image, String job, String country,String bio) {
    return 
       Container(color: Colors.grey[400],
        height: 150,
        child: Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                image,
                width: 140,
                height: 120,
              )),
         
                       Flexible(
                                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 name == null ?  Text("No name") : Expanded(flex:1,child: Container(margin: EdgeInsets.only(top:10,right: 20),child:Text(name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))),
                 name == null ?  Text("No name") : Expanded(flex:1,child: Container(margin: EdgeInsets.only(right:15),child:Text(job+' from  '+country,style: TextStyle(color: Colors.white54,fontSize: 13,fontWeight: FontWeight.w500 ),))),
                 name == null ?  Text("No name") : Expanded(flex:2,child: Container(margin:EdgeInsets.only(bottom:20),child:Text(bio,style: TextStyle(color: Colors.grey[600],fontSize: 12,fontStyle: FontStyle.italic),))),
                 
                       
                                                 
                       
                    
              ],
            ),
                       ),
          
        ]),
      );
    
  }
}
