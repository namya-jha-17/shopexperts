import 'dart:math';


import 'package:cocktail/Model/ResponseModel.dart';
import 'package:cocktail/viewModel/Provider/cartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../Model/Cart.dart';
import '../Widget/ListWidget.dart';

final cartlistProvider=StateNotifierProvider<CartProvider,Cart>((ref){
  return CartProvider();

});

class CartList extends ConsumerStatefulWidget {
  List<ResponseModel> ?cartlist;


  CartList(this.cartlist);

  @override
  ConsumerState<CartList> createState() => _CartListState();
}

class _CartListState extends ConsumerState<CartList> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // provider = Provider.of(context, listen: false);
     // provider.fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    var cartitem=ref.watch(cartlistProvider.notifier);
    return Scaffold(
        backgroundColor: Color.fromARGB(0, 100, 0, 10),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartitem.state.cartItems?.length,

              //cartitem.state.cartItems?.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: SizedBox(
                    width: 70,
                    height: 50,
                    child: Image.network(

                        cartitem.state.cartItems?[index].image??""

                    ),
                  ),
                  title: Text(cartitem.state.cartItems?[index].title??"no items in cart"
                    ,style: TextStyle(color: Colors.white),),
                  subtitle: Container(
                    width: 60,
                    height: 20,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              print('onpressen is called ');
                              // print('quantity:${list.qty}');
                              // list.decqty();
//cartitem.addToCart(responseModel)

                              },
                            icon: Icon(CupertinoIcons.minus_square)),
                     //   SizedBox(height: 20, width: 20, child: Text("${list.qty}")),
                        IconButton(
                          onPressed: () {

                        //    list.incqty();
//
                            },
                          icon: Icon(CupertinoIcons.plus_app),
                        ),
                      ],
                    ),
                  ),
                  tileColor:
                      Color(
                          Random().nextInt(0xffffffff)).withAlpha(0xff),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                  //    list.DeleteCart(index);
                    },
                  ),
                );
              }),
        ),
      );

  }
}
