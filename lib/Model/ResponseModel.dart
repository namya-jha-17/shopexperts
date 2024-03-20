import 'dart:convert';


List<ResponseModel> postFromJson(String str) =>
    List<ResponseModel>.from(json.decode(str).map((x) => ResponseModel.fromJson(x)));


class ResponseModel {
  final num id;
  final String title;
 final num price;
 final String description;
  final String category;
  final String image;
 final  Rating rating;


  ResponseModel({
   required this.id,
   required this.title,
   required this.price,
  required  this.description,
  required  this.category,
   required this.image,
    required this.rating,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
          id: json["id"],
          title: json["title"],
          price: json["price"].toDouble(),
          description: json["description"],
          category: json["category"],
          image: json["image"],
          rating: Rating.fromJson(json["rating"]),
      );

  @override
  String toString() {
    return 'ResponseModel{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating}';
  }
}

class Rating {
final  num rate;
 final num count;


  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"] ,
    count: json["count"],
  );
}