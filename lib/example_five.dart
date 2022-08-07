import 'dart:convert';

import 'package:apititorial/Models/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example_five extends StatefulWidget {
  const Example_five({Key? key}) : super(key: key);

  @override
  _Example_fiveState createState() => _Example_fiveState();
}

class _Example_fiveState extends State<Example_five> {
   Future<ProductsModel> getProductsApi() async{
     final response = await http.get(Uri.parse('https://webhook.site/5204f3e2-4eb2-41d2-a17f-ebc25ae844e6'));
     var data = jsonDecode(response.body.toString());

     if(response.statusCode==200){
       return ProductsModel.fromJson(data);

     }else{
       return ProductsModel.fromJson(data);

     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is example five'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<ProductsModel>(
                future: getProductsApi(),
                builder: (context, snapshot){
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height *.3,
                            width: MediaQuery.of(context).size.width *1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.data![index].image!.length,

                                itemBuilder: (context, postion){
                                return Container(
                                  height: MediaQuery.of(context).size.height *.25,
                                  width: MediaQuery.of(context).size.width *.5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data!.data![index].image![postion].toString())
                                    )
                                  ),
                                );
                                }
                            ),

                          )
                        ],
                      );
                      }
                  );

                }
              )
          )


        ],
      ),
    );
  }
}
