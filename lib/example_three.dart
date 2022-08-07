import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Models/userModels.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  _ExampleThreeState createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  List<UserModels> userlist=[];
  Future<List<UserModels>> getPostApi()async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        userlist.add(UserModels.fromJson(i));
      }
      return userlist;
    }else{
      return userlist;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Three"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot){
                  return ListView.builder(
                      itemCount: userlist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text('Id',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                    Text(userlist[index].id.toString()),
                                  ],
                                ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                 children: [
                                   Text('Title',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                   Text(userlist[index].address.toString()),
                                 ],
                               ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text('Discription',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  Text(userlist[index].email.toString()),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text('geo',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  Text(userlist[index].address!.geo!.lng.toString()),

                                ],
                              ),
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
