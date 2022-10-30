import 'package:flutter/material.dart';

class GreatIdeas extends StatefulWidget {
  const GreatIdeas({Key? key}) : super(key: key);

  @override
  State<GreatIdeas> createState() => _GreatIdeasState();
}

class _GreatIdeasState extends State<GreatIdeas> {
  Set<String> ideas = {};
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Great Ideas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: textEditingController,
              onSubmitted: (String value) {
                setState(() {
                  ideas.add(value);
                  textEditingController.clear();
                });
              },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.light),
                labelText: 'New Idea'),),


          ),
          Expanded(child: ListView.separated(separatorBuilder:(context, index) => Divider(),
              itemCount: ideas.length,
              itemBuilder: (context, index) {
            return ListTile(
              title: Text(ideas.elementAt(index)),
              onTap: () async {
                var result = await Navigator.pushNamed(context, '/ideas-detail', arguments: ideas.elementAt(index)) as List;
                setState(() {
                  if(result[0]){
                    ideas.add(result[1]);
                  }else {
                    ideas.remove(result[1]);
                  }
                });
              },
            );
              }))
          
        ],
      ),
    );
  }
}
