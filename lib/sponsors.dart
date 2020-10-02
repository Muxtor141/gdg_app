import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import './list.dart';
import 'package:url_launcher/url_launcher.dart';

class Sponsors extends StatefulWidget {
  @override
  _SponsorsState createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  List<Sponsor> alldata = [];
  @override
  void initState() {
    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('partners/1/logos').once().then((DataSnapshot snap) {
      var keys1 = snap.value;
      var data = snap.value;

      alldata.clear();
      for (var key in keys1) {
        Sponsor newList2 = new Sponsor(
          key['logoUrl'],
          key['name'],
          key['url'],
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
        title: Text(
          'Sponsors',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.grey[400],
      ),
      body: Container(
          color: Colors.white,
          child: alldata.length == 0
              ? new Container(color: Colors.grey[400],child: Center(child: Text('Loading...')))
              : new ListView.builder(
                  itemCount: alldata.length,
                  itemBuilder: (_, index) {
                    return UI(
                      alldata[index].sponsorLogo,
                      alldata[index].sponsorName,
                      alldata[index].sponsorUrl,
                    );
                  },
                )),
    );
  }

  Widget UI(
    String logo,
    String name,
    String url,
  ) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[400], border: Border.all(color: Colors.black38)),
        height: 150,
        child: Row(children: [
          logo == 0
              ? Container(
                  child: Center(child: Text('no logo')),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                      logo,
                      width: 140,
                      height: 120)),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                name + url == null
                    ? Text("No name")
                    : Container(
                        margin: EdgeInsets.only(top: 0, left: 10),
                        child: Text(
                          name,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                        
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    left: 20,
                    bottom: 50,
                  ),
                  child: Text(
                    'Status :  Organizer',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
      onTap: () {
        launch(url);
      },
    );
  }
}
