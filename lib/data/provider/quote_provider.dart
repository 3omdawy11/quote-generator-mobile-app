import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator_intern/data/api_services/quotes_api.dart';
import 'package:quote_generator_intern/data/model/quote_model.dart';

final quoteDataProvider = FutureProvider<List<Quote>>((ref) async {
  return ref.watch(quotesProvider).getQuotes();
});