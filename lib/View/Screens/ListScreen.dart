//import 'package:cocktail/ApiService/ApiService.dart';
// import 'dart:convert';
// import 'dart:io';
import 'package:cocktail/Model/response.dart';
import 'package:cocktail/viewModel/Provider/ProductProvider.dart';
import 'package:cocktail/viewModel/Provider/cartProvider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



import '../../Model/Cart.dart';
import '../../Model/ResponseModel.dart';
import '../../viewModel/Provider/listprovider.dart';
import '../Widget/ListWidget.dart';
import 'CartPage.dart';
import 'DetailsScreen.dart';






final product_listProvider=FutureProvider<List<ResponseModel>>((ref) async {
  return ref.watch(apiprovider).getData();
});

class ListScreen extends ConsumerStatefulWidget{




  @override
  ConsumerState createState() => _ListScreenState();

  ListScreen();
}

class _ListScreenState extends ConsumerState {

 // late ListProvider provider ;


  @override
  void initState() {

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
final cart=ref.watch<Cart>(cartlistProvider);
    final pList=ref.watch(product_listProvider);
  // var drinklist= context.watch<>().drinks;
    return Scaffold(backgroundColor: CupertinoColors.black,
      appBar: AppBar(backgroundColor: Colors.white10,
        actions: [Icon(CupertinoIcons.search),IconButton(
            onPressed: (){
print('cartitem----  ${cart.cartItems?.length}');
        Navigator.push(context, MaterialPageRoute(builder:
            (context)=>CartList(cart.cartItems),),);

        }, icon: Icon(Icons.shopping_cart),),],

      ),
      body:
         pList.when(data: (pList) {
           List<ResponseModel> products=pList.map((e)=>e).toList();

return  Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: GridView.builder(
                           itemCount:products.length,
            gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                             childAspectRatio: 3/4.5,
                               mainAxisSpacing: 10,
                               crossAxisCount: 2,
                               crossAxisSpacing: 5),
                           itemBuilder: (BuildContext context, int index) {
                             return Container(
                                  // height: 200,
                                  // width: 150,

                                 child:InkWell(onTap:(){
                                   Navigator.push(context,
                                       MaterialPageRoute(builder: (ctx)=>DetailsScreen(
                                           products[index].id.toInt(),
                                       ),
                                       ),
                                   );
                                 },
                                   //
                              child: ListWidget(rModel: products[index],),
                             ),
                             );
                                     // Image.network(snapshot.data![index].strDrinkThumb));
                           }),
    )
         ;
},
             error: (error,s)=>Text(error.toString()), loading:()=>
                 Center(child: CircularProgressIndicator())

           ),



          );

  }
}

/*
 //   drinklist,
          //future:apiServices.getData(),
          // builder: (context, snapshot,child) {
          //   print('this is the snapshot :${snapshot.drinks.length ?? []}');
          //   if (snapshot.hasData) {
          //     return Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: GridView.builder(
          //           itemCount: snapshot.data?.length,
          //
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             childAspectRatio: 3/4.5,
          //               mainAxisSpacing: 10,
          //               crossAxisCount: 2,
          //               crossAxisSpacing: 5),
          //           itemBuilder: (BuildContext context, int index) {
          //             return Container(
          //                  // height: 200,
          //                  // width: 150,
          //
          //                 child:InkWell(onTap:(){
          //                   Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsScreen(snapshot.data![index].idDrink)));
          //                 },child: ListWidget(rModel: snapshot.data![index],),),
          //             );
          //                     // Image.network(snapshot.data![index].strDrinkThumb));
          //           }),
          //     );
          //   } else {
          //     return Center(child: CircularProgressIndicator());
          //   }
          // }
 */
