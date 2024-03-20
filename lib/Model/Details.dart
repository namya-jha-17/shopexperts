
class Details {
  List<Drinks>? drinklist;

  Details({required this.drinklist});

  Details.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {

      json['drinks'].forEach((v) {
        drinklist?.add(new Drinks.frommap(v));
      });
    }
  }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.drinklist != null) {
//       data['drinks'] = this.drinklist?.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
}


class Drinks {
final  String idDrink;
  final String strDrink;
  final String strCategory;
  final String strAlcoholic;
  final String strGlass;
  final String strInstructions;
  final String strInstructionsDE;
  final String strInstructionsIT;
  final String strDrinkThumb;
  final String strIngredient1;
final  String strIngredient2;
final String strIngredient3;
final String strIngredient4;
final String strMeasure1;
final  String strMeasure2;
final  String strMeasure3;
final  String strMeasure4;
final  String strCreativeCommonsConfirmed;
final   String dateModified;


  Drinks({required this.idDrink, required this.strDrink, required this.strCategory, required this.strAlcoholic,
      required this.strGlass, required this.strInstructions, required this.strInstructionsDE,
      required this.strInstructionsIT, required this.strDrinkThumb, required this.strIngredient1,
      required this.strIngredient2, required this.strIngredient3, required this.strIngredient4,
      required this.strMeasure1, required this.strMeasure2, required this.strMeasure3, required this.strMeasure4,
      required this.strCreativeCommonsConfirmed, required this.dateModified});

factory Drinks.frommap(Map<String, dynamic> json)=>
   Drinks(idDrink: json["idDrink"], strDrink:json ["strDrink"], strCategory: json['strCategory'],
      strAlcoholic: json['strAlcoholic'], strGlass: json['strGlass'], strInstructions: json['strInstructions'],
      strInstructionsDE: json['strInstructionsDE'], strInstructionsIT: json['strInstructionsIT'],
       strDrinkThumb:json ['strDrinkThumb'], strIngredient1: json['strIngredient1'], strIngredient2: json['strIngredient2'],
       strIngredient3: json['strIngredient3'], strIngredient4:json ['strIngredient4'], strMeasure1: json['strMeasure1'], strMeasure2:
       json  ['strMeasure2'], strMeasure3:json ['strMeasure3'], strMeasure4:json ['strMeasure4'],
       strCreativeCommonsConfirmed:json ['strCreativeCommonsConfirmed'], dateModified: json['dateModified']
   );

}
//factory Drinks.fromjson(Map<String, dynamic> map) => Drinks.fromjson(map);




// Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['idDrink'] = idDrink;
//     data['strDrink'] = this.strDrink;
//     data['strCategory'] = this.strCategory;
//     data['strAlcoholic'] = this.strAlcoholic;
//     data['strGlass'] = this.strGlass;
//     data['strInstructions'] = this.strInstructions;
//     data['strInstructionsDE'] = this.strInstructionsDE;
//    data['strInstructionsIT'] = this.strInstructionsIT;
//     data['strDrinkThumb'] = this.strDrinkThumb;
//     data['strIngredient1'] = this.strIngredient1;
//     data['strIngredient2'] = this.strIngredient2;
//     data['strIngredient3'] = this.strIngredient3;
//     data['strIngredient4'] = this.strIngredient4;
//    data['strMeasure1'] = this.strMeasure1;
//     data['strMeasure2'] = this.strMeasure2;
//     data['strMeasure3'] = this.strMeasure3;
//     data['strMeasure4'] = this.strMeasure4;
//      data['strCreativeCommonsConfirmed'] = this.strCreativeCommonsConfirmed;
//     data['dateModified'] = this.dateModified;
//     return data;
//   }
