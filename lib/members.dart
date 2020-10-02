import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gdg_app/list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Members extends StatefulWidget {


  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  List<Members1> alldata = [];
  
  @override
  void initState() {
    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    String speakers = 'team/0/members';
    ref.child(speakers).once().then((DataSnapshot snap) {
     
      var keys = snap.value;
 
      alldata.clear();
      for (var key in keys) {
       var socials =key['socials'];
      
        Members1 newList1 = new Members1(
          key['photoUrl'],
          key['title'],
          key['name'],
          socials[0]['link'],
     
          
        );

        alldata.add(newList1);
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Program Committee',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
      ),
      body: Container(
          color: Colors.white,
          child: alldata.length == 0
              ? new Container(color:Colors.grey[400],child: Center(child: Text('Loading...')))
              : new ListView.builder(
                  itemCount: alldata.length,
                  itemBuilder: (_, index) {
                    return UI(
                      alldata[index].memberImage,
                      alldata[index].memberJob,
                      alldata[index].memberName,
                      alldata[index].facebookLogo,
                     
                    );
                  },
                )),
    );
  }

  Widget UI(String image, String job, String name,String facebook, ) {
    return Container(
      color: Colors.grey[400],
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              name == null
                  ? Text("No name")
                  : Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(top: 10, right: 20),
                          child: Text(
                            name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ))),
              name == null
                  ? Text("No name")
                  : Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(top: 10, right: 5),
                          child: Row(
                            children: [Container(margin:EdgeInsets.only(left:15),child: Text('from     ',style: TextStyle(fontSize:10,fontStyle:FontStyle.italic,color: Colors.grey),)),
                              Text(
                                job,
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ))),
              name == null
                  ? Text("No name")
                  : Expanded(
                      flex: 2,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                        IconButton(
                                color: Colors.black,
                                iconSize: 15,
                           icon: FaIcon(FontAwesomeIcons.twitter),
                           onPressed: ()=>print('hello'),
                               
                                
                              ),
                              IconButton(
                                  color: Colors.black,
                                  iconSize: 15,
                                  icon: FaIcon(FontAwesomeIcons.facebookF),
                                  onPressed: () {
                                    launch(facebook);
                                  }),
                               
                              IconButton(
                                  color: Colors.black,
                                  iconSize: 15,
                                  icon: FaIcon(FontAwesomeIcons.chrome),
                                  onPressed: ()=>print('hello'),
                                 ),
                            ],
                          ))),
            ],
          ),
        ),
      ]),
    );
  }
}
