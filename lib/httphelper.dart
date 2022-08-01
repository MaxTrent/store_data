import 'pizza.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;



class HttpHelper{
  final String authority = '02z2g.mocklab.io';
  final String path = 'pizzalist';

  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() => _httpHelper;

Future<List<Pizza>?> getListPizza() async{
  Uri url = Uri.https(authority, path);
  http.Response result = await http.get(url);
  if (result.statusCode == HttpStatus.ok){
    final jsonResponse = json.decode(result.body);

    List<Pizza> pizzas = jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
    return pizzas;
  }
  else{
    return null;
  }
}

Future<String> postPizza(Pizza pizza) async{
  String post = json.encode(pizza.toJson());
  Uri url = Uri.https(authority, postPath);
  http.Response r = await http.post(
    url,
    body: post,
  );
  return r.body;
}

}

