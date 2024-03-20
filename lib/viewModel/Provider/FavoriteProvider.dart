import 'package:cocktail/Model/FeaturedRecipe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<List<FeturedRecipe>>{
  FavoriteNotifier():super([]);

  void toggleFavorite(int index, List<FeturedRecipe> data){
    final recipeIsFav=state.contains(data[index]);
    print('asdfggjg');
    print(recipeIsFav);
    if(recipeIsFav){
      state=state.where((fR) => fR.recipe_fname !=data[index].recipe_fname).toList()
;
    }else {
      state = [...state,data[index]];
    }
  }
}





// NotifierProvider<FavoriteNotifier, List<FeturedRecipe>>(
    //    (ref) { return FavoriteNotifier();} );