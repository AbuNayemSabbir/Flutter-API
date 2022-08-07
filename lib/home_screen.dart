import 'dart:convert';

import 'package:apititorial/Models/PostModels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModels> postlist=[];
  Future<List<PostModels>> getPostApi()async{
   final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
   var data=jsonDecode(response.body.toString());
   if(response.statusCode==200){
     for(Map i in data){
       postlist.add(PostModels.fromJson(i));
     }
     return postlist;
   }else{
     return postlist;

   }
   }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot){
             return ListView.builder(
                 itemCount: postlist.length,
                 itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Id',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text(postlist[index].id.toString()),
                        Text('Title',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text(postlist[index].title.toString()),
                        Text('Discription',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text(postlist[index].body.toString()),
                      ],
                    ),
                  ),
                );
                   // return Text(index.toString());
              });
              }

    ),
          )

        ],
      ),
    );
  }
}
