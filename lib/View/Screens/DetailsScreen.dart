import 'dart:convert';

import 'package:cocktail/View/Screens/stepsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:http/http.dart' as http;

import '../../Model/Details.dart';

class DetailsScreen extends StatefulWidget {
  // late Drinks drinks;
  int id;

  DetailsScreen(this.id);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<List<Drinks>> drinklist;

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
      result['drinks'].map((item)async {
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
  //  drinklist = _getDetails(widget.idDrink);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: CupertinoColors.black,
      body: FutureBuilder<List<Drinks>>(
          future: drinklist,
          //_getDetails(widget.idDrink),
          builder: (context, snapshot) {
            // print('this is the snapshot :${snapshot.data?.length ?? []}');
            if (snapshot.hasData) {
          print('this is the snapsho----------t :${snapshot.data}');

              return
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Stack(children: [
                    Container(height: 400,width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(image:DecorationImage(image:
                     NetworkImage("${snapshot.data!.first.strDrinkThumb}",),fit: BoxFit.fill


                      ),)
                  ,),
                    Positioned(bottom:30,left:40,
                      child: Container( width: 200,
                        child: Text("${snapshot.data?.first.strDrink}",softWrap: true,
                        style:  TextStyle(fontWeight: FontWeight.bold,
                            color: CupertinoColors.white,fontSize: 30),
                        ),
                      ),
                    ),
                  ],

                      ),
                    Container(height: 300,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40,),
                          Text("Alcohol:",style: TextStyle(fontWeight: FontWeight.bold,color: CupertinoColors.white),),
                          Text("${snapshot.data!.first.strMeasure1} ${snapshot.data!.first.strIngredient1}",
                            style: TextStyle(fontSize: 10,color: CupertinoColors.white),),
                          Text("${snapshot.data!.first.strMeasure2} ${snapshot.data!.first.strIngredient2}",
                            style: TextStyle(fontSize: 10,color: CupertinoColors.white),),
                          SizedBox(height: 30,),
                          Text("Juice:",style: TextStyle(fontWeight: FontWeight.bold,color: CupertinoColors.white),),
                          Text("${snapshot.data!.first.strMeasure1} ${snapshot.data!.first.strIngredient1}",
                            style: TextStyle(fontSize: 10,color: CupertinoColors.white),),
                          Text("${snapshot.data!.first.strMeasure2} ${snapshot.data!.first.strIngredient2}",
                            style: TextStyle(fontSize: 10,color: CupertinoColors.white),),
                          Text("${snapshot.data!.first.strMeasure3} ${snapshot.data!.first.strIngredient3}",
                            style: TextStyle(fontSize: 10,color: CupertinoColors.white),),


                        ],
                      ),
                    ),
                     Center(child:ElevatedButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(
                           builder: (ctx)=>StepScreen(snapshot.data!.first.idDrink)));
                     }, child: Text("Start Mixing"),)),
              ]  ),
                );
            }


            else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
