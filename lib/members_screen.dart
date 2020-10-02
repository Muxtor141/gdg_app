import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gdg_app/list.dart';
import './members.dart';
import './members_core.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<MemberSc> alldata = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    String speakers = 'team';
    ref.child(speakers).once().then((DataSnapshot snap) {
      var keys = snap.value;
      alldata.clear();
      for (var key in keys) {
        MemberSc newList2 = new MemberSc(
          keys[0]['title'],
          keys[1]['title'],
        );

        alldata.add(newList2);
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            margin: EdgeInsets.only(right: 40),
            child: Center(child: Text('Team Members'))),
        backgroundColor: Colors.grey[400],
      ),
      body: Container(
          color: Colors.grey[400],
          child: alldata.length == 0
              ? new Container(
                  color: Colors.grey[400],
                  child: Center(child: Text('loading')))
              : new ListView.builder(
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return screen(alldata[index].name, alldata[index].name2);
                  })),
    );
  }

  Widget screen(String title, String title2) {
    return Container(
      margin: EdgeInsets.only(top: 170),
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: double.infinity,
            child: RaisedButton(
              color: Colors.white70,
              onPressed: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Members()));
              }),
              child: Center(child: Text(title)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 70,
            width: double.infinity,
            child: RaisedButton(
              color: Colors.white70,
              onPressed: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>CoreTeam()));
              }),
              child: Center(
                  child: Text(
                title2,
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
