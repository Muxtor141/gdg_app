import 'dart:ui';

import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: myBoxDecoration(),
      child: Text('Card'),
    
    );
  }
}
