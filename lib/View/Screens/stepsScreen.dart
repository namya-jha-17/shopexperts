import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Model/Details.dart';


class StepScreen extends StatefulWidget {
  String idDrink;

  StepScreen(this.idDrink);

  @override
  State<StepScreen> createState() => StepScreenState();
}

class StepScreenState extends State<StepScreen> {
  late Future<List<Drinks>>? drinklist;

  Future<List<Drinks>> _getDetails(String drinkId) async {
    String endPoint = 'api/json/v1/1/lookup.php';
    const baseUrl = 'www.thecocktaildb.com';
    List<Drinks> drinks = [];
    //try {
    //  HttpClient client = HttpClient();
    Uri uri = Uri.https(baseUrl, endPoint, {'i': drinkId});
    final http.Response res = await http.get((uri));

    // res.headers
    //     .(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    if (res.statusCode == 200) {
      var result = jsonDecode(res.body);
      for (int i = 0; i < result['drinks'].length; i++) {
        print(result['drinks'][i]['strDrink']);

        drinks.add(Drinks.frommap(result['drinks'][i]));
      }
      result['drinks'].map((item) async {
        // drinks.add(Drinks.frommap(result['drinks']));
        print(drinks.runtimeType);
      });
    }
    return drinks;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    drinklist = _getDetails(widget.idDrink);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( backgroundColor: CupertinoColors.black,
      body: FutureBuilder <List<Drinks>> (
        future: drinklist,
        //_getDetails(widget.idDrink),
        builder: (context, snapshot) {
         List<String>? step=  snapshot.data?.first.strInstructions.split(".");
          // print('this is the snapshot :${snapshot.data?.length ?? []}');
          if (snapshot.hasData) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 330,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              snapshot.data!.first.strDrinkThumb)
                      )
                  ),
                ),
                Text("Steps:",style: TextStyle(color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,fontSize: 20),),
                Container(margin: EdgeInsets.all(10),
height: 400,
                  width: 450,
                  child: ListView.builder(itemCount: step?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Text(" 0${index+1}",style: TextStyle(color: Colors.orange),),

                            title: Text("${step?[index]}",style: TextStyle(color: Colors.white),),
                        );
                      }),
                  
                  
                  // Text(snapshot.data!.first.strInstructions,softWrap: true,style: (TextStyle(color: CupertinoColors.white)),),

                )
              ],
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
