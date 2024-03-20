import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'ResponseModel.dart';



import 'package:http/http.dart' as http;
class ApiServices {
List<ResponseModel> items =[];

  Future<List<ResponseModel>> getData() async {
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
            List<ResponseModel> resp = List<ResponseModel>.from(result.map((model)
            => ResponseModel.fromJson(model)));

return resp;

        }
      } catch (e) {
        debugPrint(e.toString());
      }

return [];
    }

  }