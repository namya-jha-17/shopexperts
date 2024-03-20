import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widget/TodayRecipeWidget.dart';
import '../Widget/Sliderwidget.dart';
import 'ListScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();

  const MyHomePage();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // void _onItemTapped(int index) {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: ListView(shrinkWrap: true,
        children: [
         SliderWidget(),
          Padding(
            padding: const EdgeInsets.only( left: 25),
            child: Row(
              children: [
                Text(
                  "Special Discount ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                ),
                InkWell(
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 15, color: Colors.white60
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => ListScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
         Spwidget(),
        ],
      ),
    );
  }
}
