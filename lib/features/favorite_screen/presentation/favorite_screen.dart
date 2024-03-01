import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator_intern/constants.dart';
import 'package:quote_generator_intern/features/favorite_screen/presentation/widgets/back_to_home_button.dart';
import 'package:quote_generator_intern/features/favorite_screen/presentation/widgets/search_field.dart';

import '../../../data/model/quote_model.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key, required this.favoriteQuotes}) : super(key: key);

  // Initialize quotes and searchedQuotes lists
  List<Quote> favoriteQuotes; // Provide initial empty list
  late List<Quote> searchedQuotes = []; // Provide initial empty list

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackGroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BackToHomeButton(),
                const SizedBox(
                  height: 10,
                ),
                SearchField(
                  onChanged: () {
                    //searchedQuotes = quotes.where((quote) => quote)
                  },
                ),
                const SizedBox(
                  height: 5,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
