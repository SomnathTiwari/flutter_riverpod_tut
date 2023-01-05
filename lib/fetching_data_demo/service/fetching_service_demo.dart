import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod_tut/fetching_data_demo/model/fetching_model.dart';
import 'package:http/http.dart' as http;

class HttpFetching {
  Future<List<UserModel>> fetchData() async {
    const String baseUrl = 'https://jsonplaceholder.typicode.com';
    const String endPoint = '/posts';
    var res = await http.get(Uri.parse(baseUrl + endPoint));
    List<UserModel> ul = [];
    if (res.statusCode == 200) {
      List parsedJson = jsonDecode(res.body);

      ul = parsedJson.map((e) => UserModel.fromMap(e)).toList();

      return ul;
    } else {
      throw Exception('An Error Occured with ${res.statusCode}');
    }
  }
}
