import 'package:flutter/material.dart';
import './agenda.dart';
import './speakers.dart';
import './sponsors.dart';
import './members.dart';
import './members_screen.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Widget icons;


  Button(this.buttonText, this.icons,);
  void hello() {
    int index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 60,
        height: 70,
        child: DecoratedBox(
            decoration: ShapeDecoration(color:Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: OutlineButton(
                
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: ((){if(buttonText=='Agenda'){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Agenda()))
                  ;}
                  if(buttonText=='Speakers'){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Speaker()))
                  ;}
                  if(buttonText=='Team'){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Members()))
                  ;}
                   if(buttonText=='Sponsors'){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Sponsors()))
                  ;}
                  
                
                }),
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                  width: 0.2,
                ),
                child: Column(children: [
                  icons,
                  Text(
                    buttonText,
                    style: TextStyle(fontSize: 10),
                  )
                ]))));
  }
}
