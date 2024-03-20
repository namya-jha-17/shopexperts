import 'package:flutter/cupertino.dart';

import '../../Model/Details.dart';


class Detail_Photo extends StatelessWidget{
  Drinks drinks;

  Detail_Photo(this.drinks);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Image.network(drinks.strDrinkThumb),
Container(width:200,child: Text(drinks.strDrink,softWrap: true,),)      ],
    );
  }

}