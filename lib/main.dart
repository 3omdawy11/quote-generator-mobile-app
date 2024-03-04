import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quote_generator_intern/app_router.dart';
import 'package:quote_generator_intern/constants.dart';
import 'package:quote_generator_intern/features/home_screen/cached_data/quotes_entity.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(QuoteEntityAdapter());
  await Hive.openBox<QuoteEntity>(kFavoriteBoxName);
  print('Going to App');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.gemunuLibre().fontFamily
      ),
      debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().generateRoute,
    );
  }
}

