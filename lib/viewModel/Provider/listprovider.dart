import 'package:cocktail/Model/ResponseModel.dart';
import 'package:cocktail/Model/response.dart';
import 'package:riverpod/riverpod.dart';

// class ProductListProvider extends StateNotifier<List<ResponseModel>>{
//   ApiServices apiServices=ApiServices();
//   Future <List<ResponseModel>>?products;
//   ProductListProvider():super([]);
//   Future<List<ResponseModel>>? getProducts(){
// try
//     { products = apiServices.getData();
//
// } catch(e){
//   e.toString();
//
// }
// print("here is productprovider");
//   return products;
//   }
//
//
// }