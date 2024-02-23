import 'package:flutter/material.dart';
import 'package:quote_generator_intern/features/favorite_screen/presentation/favorite_screen.dart';
import 'package:quote_generator_intern/features/home_screen/presentation/home_screen.dart';

import 'constants.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kHomeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case kFavoriteScreen:
        return MaterialPageRoute(
          builder: (context) => const FavoriteScreen(),
        );
    }
    return null;
  }
}
