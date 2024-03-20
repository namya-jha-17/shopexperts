import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Model/FeaturedRecipe.dart';



class FeatureDetails extends StatefulWidget {
  FeturedRecipe feturedRecipe;

  FeatureDetails(this.feturedRecipe);

  @override
  State<FeatureDetails> createState() => _FeatureDetailsState();
}

class _FeatureDetailsState extends State<FeatureDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Featured Recipe", style: TextStyle(color: CupertinoColors.white),),
        Text(
          '${widget.feturedRecipe.recipe_fname}', style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold, color: Colors.white),),
        Text(
          '${widget.feturedRecipe.recipe_lname}', style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold, color: Colors.white),),
    Row(children: [
          Container( width: 60, height: 10,




    child:     RatingBar(

              initialRating: widget.feturedRecipe.Strong,
              maxRating: widget.feturedRecipe.Strong,

              direction: Axis.horizontal,
              allowHalfRating: false,
              itemSize: 10,
              itemCount: 5,
              ratingWidget: RatingWidget(

                  full: Icon(
                    CupertinoIcons.circle_fill,  color: Colors.white,),
                  half: Icon(CupertinoIcons.circle_lefthalf_fill,
                    color: Colors.white,), //_image('assets/heart_half.png'),
                  empty: Icon(CupertinoIcons.circle,
                    color: Colors.white,) //_image('assets/heart_border.png'),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 0.8),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Text("${widget.feturedRecipe.Strong}",
            style: TextStyle(color: Colors.white),),
          SizedBox(width: 20, height: 10,),

          Icon(CupertinoIcons.heart_fill, size: 10,
            color: CupertinoColors.white,),
      Text("${widget.feturedRecipe.likes}",style: TextStyle(color: Colors.white),)

        ],
        ),

      ],
    );


  }
}