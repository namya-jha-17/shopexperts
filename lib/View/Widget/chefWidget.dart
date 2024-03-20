import 'package:cocktail/Model/FeaturedRecipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChefWidget extends StatefulWidget{
  FeturedRecipe feturedRecipe;

  ChefWidget(this.feturedRecipe);

  @override
  State<ChefWidget> createState() => _ChefWidgetState();
}

class _ChefWidgetState extends State<ChefWidget> {
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Row(children: [
       CircleAvatar(backgroundImage:NetworkImage(widget.feturedRecipe.chef_image)  ,)
       ,Column(children: [Text(widget.feturedRecipe.chef_name,
         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.white),
       ),

         Text("Posted ${widget.feturedRecipe.timeline} ago",style: TextStyle(fontSize: 7,color: Colors.white),),

       ],)
     ],)
   );
  }
}