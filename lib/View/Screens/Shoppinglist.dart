import 'package:cocktail/Model/FeaturedRecipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/Data/data.dart';
import '../../viewModel/Provider/FavoriteProvider.dart';


class ShoppingList extends ConsumerStatefulWidget{

  @override
  ConsumerState<ShoppingList> createState() => _ShoppingListState();

 const ShoppingList();
}

class _ShoppingListState extends ConsumerState<ShoppingList> {
  final favoriteprovider =StateNotifierProvider<FavoriteNotifier,List<FeturedRecipe>>((ref){ return

    FavoriteNotifier();

  });
  List<FeturedRecipe> favorite=[];

  String Svalue=Shoppe.first;
  @override
  Widget build(BuildContext context) {
    final listFav = ref.watch(favoriteprovider);
    // TODO: implement build
    return Scaffold( body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Container( height: 600,
       child: ListView.builder(
            itemCount: listFav.length,
            itemBuilder: (context, index) {
        return ListTile(
        title: Text(listFav[index].chef_name,),
        );
        },),
     )




      ],
    ),

    );
  }
}