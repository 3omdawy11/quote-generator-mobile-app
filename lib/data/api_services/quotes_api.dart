import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../model/quote_model.dart';
class QuotesApi {
  String baseUrl = "https://api.quotable.io";
  Future<List<Quote>> getQuotes() async {
    Response response = await get(Uri.parse("$baseUrl/quotes"));
    if(response.statusCode == 200){
      final List result = jsonDecode(response.body)['results'];
      return result.map((e) => Quote.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final quotesProvider = Provider<QuotesApi>((ref)=> QuotesApi());