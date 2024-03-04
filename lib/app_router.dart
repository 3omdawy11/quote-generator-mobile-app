import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator_intern/data/model/quote_model.dart';
import 'package:quote_generator_intern/features/favorite_screen/presentation/favorite_screen.dart';
import 'package:quote_generator_intern/features/home_screen/presentation/home_screen.dart';

import 'constants.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kHomeScreen:
        return MaterialPageRoute(
          builder: (context) =>  const HomeScreen(),
        );

      case kFavoriteScreen:
        final quotes = settings.arguments as List<Quote>;
        return MaterialPageRoute(
          builder: (context) => FavoriteScreen(
            favoriteQuotes: quotes,
          ),
        );
    }
    return null;
  }
}
