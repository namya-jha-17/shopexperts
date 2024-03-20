
import 'dart:ffi';

import 'package:cocktail/Model/ResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'View/Screens/CartPage.dart';
import 'View/Screens/ListScreen.dart';
import 'View/Screens/homePage.dart';
//import '';

void main() {
  runApp(ProviderScope(child: const MyApp()),);
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context,) {


    return
       MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
canvasColor: Colors.white12,
          cardColor: Colors.black,
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black38),
          useMaterial3: true,
        ),
        home:  Scaffold(
          body: Center(

            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: SizedBox(height: 75,
      child: BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.local_fire_department_outlined),label: "Discover"),
      BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
      BottomNavigationBarItem(icon: Icon(Icons.add_circle),label: "Create"),
    //  BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: "Shopping"),
      BottomNavigationBarItem(icon: Icon(Icons.man_3_rounded),label: "Profile"),

      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
      ),
        ),
      ),
      );

  }
}
var _selectedIndex=0;
  List<Widget> _widgetOptions = <Widget>[

    const MyHomePage(),
     ListScreen(),
   const MyHomePage(),

 const MyHomePage(),
];

// class MyHomePage extends StatefulWidget {
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
//
//  const MyHomePage();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     // void _onItemTapped(int index) {
//     //   setState(() {
//     //     _selectedIndex = index;
//     //   });
//     // }
//     // TODO: implement build
//     return ChangeNotifierProvider<ListProvider>( create:(context) => ListProvider(),
//       child: Scaffold(
//         appBar: AppBar(backgroundColor: Colors.transparent, ),
//
//         extendBodyBehindAppBar:true,extendBody:true,backgroundColor:Colors.black,body: Column(
// children: [
// SliderWidget(),
//
// Padding(
//   padding: const EdgeInsets.all(10.0),
//   child:   Container(height: 10,width: MediaQuery.of(context).size.width,margin: EdgeInsets.all(5),),
// ),
//   Row(children: [SizedBox(width: 20,),
//       Text("Today Recipe",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
//       SizedBox(width: 200,),
//
//    InkWell(child:Text("View All",style: TextStyle(fontSize: 10,color: Colors.white60),),
//
//        onTap:(){
//        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ListScreen()));
//        } ,) ,
//   ],
//   ),
//
// TRwidget(),
//
//
//
// ],
//         ),
//
//
//  ),
//     );
//
//   }
//
//   }
//
