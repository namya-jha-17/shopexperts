import 'package:carousel_slider/carousel_slider.dart';
import 'package:cocktail/viewModel/Provider/ProductProvider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../Model/Data/data.dart';
import '../../Model/FeaturedRecipe.dart';
import '../../viewModel/Provider/FavoriteProvider.dart';


class SliderWidget extends ConsumerStatefulWidget {


  @override
  ConsumerState<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends ConsumerState<SliderWidget> {

  final favoriteprovider =StateNotifierProvider<FavoriteNotifier,List<FeturedRecipe>>((ref){ return

    FavoriteNotifier();

  });




  @override
  Widget build(BuildContext context) {
var images= ref.watch(ProductimageList);
//var featuredProducts=ref.watch(feturedProducts);


   var _currentIndex=0;

    IconData icon;
    if (ref.watch(favoriteprovider).contains(images[_currentIndex])) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    // TODO: implement build
    return
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child:
 CarouselSlider(
          options:CarouselOptions(
        autoPlay: true,
            aspectRatio: 0.87,
            viewportFraction: 1,
       // enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason){
          images.map((index) => index);
          _currentIndex= index;




        }



          ),





   items: imagesList.map((image) => Padding(padding: EdgeInsets.all(1),
           child:
           Stack(
             children: [
             SizedBox(
                 height:MediaQuery.sizeOf(context).height*0.45,width:MediaQuery.of(context).size.width,
                 child: Image.network(image,fit: BoxFit.fill,)),





           ],),
   ),
   ).toList()





        )

    ),
      );
  }
}


