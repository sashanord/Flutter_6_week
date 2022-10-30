import 'package:flutter/material.dart';

class IdeasDetail extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  IdeasDetail({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var idea = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    return Scaffold(
        appBar: AppBar(title: Text(idea),
          actions: [
            GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                Navigator.pop(context, [false,idea]);
              },
            )
          ],),
        body: Center(child: TextField(
          controller: textEditingController,
          onSubmitted: (String value) {
            Navigator.pop(context, [true,value]);
          }
          ,
        ),));
  }
}
