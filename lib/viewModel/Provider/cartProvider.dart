import 'package:cocktail/Model/ResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/Cart.dart';

class CartProvider extends StateNotifier<Cart>{
  CartProvider():super(Cart(cartItems:[]));

  //
  void addToCart(ResponseModel responseModel) {
   List<ResponseModel>? updatedCartlist = state.cartItems;
    updatedCartlist?.add(responseModel);
    state = Cart(cartItems: updatedCartlist);
  }
  void removeFromCart(int index) {
    List<ResponseModel>? updatedCartlist = state.cartItems;
    updatedCartlist?.remove(index);
    //List<ResponseModel>? c = state.cartItems;
   // updatedCartlist...;
  }
  }

//===================================================
//void togglecartStatus(int index, List<ResponseModel> productlist){
//   //   final item_added= state.contains(productlist[index]);
//   //   print(item_added);
//   //   if(item_added){
//   //     state=state.where((item) => item.id !=productlist[index].id).toList()
//   //     ;
//   //      state.add(productlist[index]);
//   //   }else {
//   //     state = [...state,productlist[index]];
//   //   }