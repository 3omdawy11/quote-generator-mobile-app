import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator_intern/data/api_services/quotes_api.dart';
import 'package:quote_generator_intern/data/model/quote_model.dart';
import 'package:quote_generator_intern/features/home_screen/cached_data/quotes_entity.dart';

final quoteDataProvider = FutureProvider<List<QuoteEntity>>((ref) async {
  return ref.watch(quotesProvider).getQuotes();
});