import 'package:cocktail/Model/ResponseModel.dart';
import 'package:cocktail/View/Screens/ListScreen.dart';
import 'package:cocktail/viewModel/Provider/cartProvider.dart';
//import 'package:cocktail/Screens/CartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../Model/Cart.dart';

final cartProvider=StateNotifierProvider<CartProvider,Cart>((ref){
  return CartProvider();

});
class ListWidget extends ConsumerStatefulWidget {
  ResponseModel rModel;
  List<ResponseModel> cartlist = [];
  ListWidget({required this.rModel});

  @override
  ConsumerState<ListWidget>createState() => _ListWidgetState();
}

class _ListWidgetState extends ConsumerState<ListWidget> {


  @override
  Widget build(BuildContext context,) {
    bool flag=false;
    final cart= ref.watch(cartProvider.notifier);
  //  final product=ref.watch(product_listProvider);
  var height=MediaQuery.sizeOf(context).height;
  var width=MediaQuery.sizeOf(context).width;
       return Column(

           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
         Stack(
           children: [
             ClipRRect(
             borderRadius: BorderRadius.all
               (Radius.circular(20),
             ),
             child: Stack(
               children: [
             Visibility(
               visible: !flag,
               replacement: const Text("added"),
               child: Container(
                   height: height*0.25,
                   width: width*0.4,
                   margin: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(
                       Radius.circular(20.0),
                     ),
                     image: DecorationImage(
                         image: NetworkImage(widget.rModel.image),
                        fit: BoxFit.fitHeight
                         ),
                   ),
                 ),
             ),
                
            ], ),
           ),

             Positioned(bottom: height*0.01,right: width*0.01,
                 child: IconButton(onPressed: () {

                      flag=true;
                      cart.addToCart(widget.rModel);
               },
               icon: Icon(CupertinoIcons.cart),),),

        ] ),
         SizedBox(
           height: height*0.01,
         ),
         Text(
           widget.rModel.title,
overflow: TextOverflow.ellipsis,
           softWrap: true,
           style: TextStyle(
               fontSize: 10,
               fontWeight: FontWeight.bold,
               color: CupertinoColors.white
           ),
         ),
             SizedBox(
               height: height*0.005,
             ),

       ]);



  }

}



