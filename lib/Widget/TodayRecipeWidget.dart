import 'package:carousel_slider/carousel_slider.dart';
//import 'package:cocktail/Model/TodayRecipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/Data/data.dart';

class Spwidget extends StatefulWidget {
  @override
  State<Spwidget> createState() => _SpwidgetState();
}

class _SpwidgetState extends State<Spwidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Container( height: MediaQuery.sizeOf(context).height*0.3,
        child: ListView.separated(
          itemCount: imagesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
            print(imagesList[index]);
          return CircleAvatar(
            radius: MediaQuery.sizeOf(context).width*0.15,


                  foregroundImage: NetworkImage(imagesList[index]),


          );
        }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: MediaQuery.sizeOf(context).width*0.1,);
        },),
      ),

    );
  }
}
