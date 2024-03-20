

//import 'package:cocktail/Data/data.dart';
import 'package:cocktail/Model/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/Data/data.dart';
import '../../Model/FeaturedRecipe.dart';
import '../../Model/ResponseModel.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

//import '../Model/FeaturedRecipe.dart';
ApiServices apiServices=ApiServices();

 // final feturedProducts=Provider<List<FeturedRecipe>>((ref){
 //   return featurelist;
 //
 // });
 final apiprovider=Provider<ApiServices>((ref){
   return ApiServices();
 });

//  final cocktaillist=Provider<Future<List<ResponseModel>>>((ref) {
//
//   return apiServices.getData();
// });

final ProductimageList= Provider<List<String>>((ref)  {
 return imagesList;

});

