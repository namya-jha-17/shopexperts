import 'dart:convert';



import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;



import 'User.dart';

class UserApiService{
  List<User> userlist=[];

  Future<List<User>> getData() async {
    try {
      //  HttpClient client = HttpClient();
      String url =
          "https://fakestoreapi.com/products";
      final http.Response res = await http.get(Uri.parse(url));

      // res.headers
      //     .(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
      if (res.statusCode == 200) {
        print('this is the res :${res.body}');

        Iterable result = json.decode(res.body);
        print("decoded===============");



        print('This is the legth :${result.length}');
        // Iterable l = json.decode(response.body);
        List<User> resp = List<User>.from(result.map((model)
        => User.fromJson(model)));

        return resp;

      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return [];
  }



}