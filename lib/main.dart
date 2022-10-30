import 'package:flutter/material.dart';
import 'package:untitled1/ideas_detail.dart';

import 'greatIdeas.dart';

void main() {
  runApp(NavApp());

}

class NavApp extends StatelessWidget {
  const NavApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/':(context) => GreatIdeas(),
         '/ideas-detail':(context)=> IdeasDetail(),
      } ,
      initialRoute: '/',

    );
  }
}





