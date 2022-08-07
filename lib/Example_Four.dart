// Api without using models
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example_four extends StatefulWidget {
  const Example_four({Key? key}) : super(key: key);

  @override
  State<Example_four> createState() => _Example_fourState();
}

class _Example_fourState extends State<Example_four> {
  var data;
  Future<void>getUserApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode==200)
      {
        data= jsonDecode(response.body.toString());
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is example Four'),

      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi() ,
                builder: (context, snapshot){
                  return ListView.builder(

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
                                    Text('name',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                    Text(data[index]['name'].toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text('Adress',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                    Text(data[index]['address']['street'].toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text('Discription',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                    Text(data[index]['email'].toString()),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text('geo',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                    Text(data[index]['address']['geo'].toString()),

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
