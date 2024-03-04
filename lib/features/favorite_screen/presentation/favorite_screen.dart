import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator_intern/constants.dart';
import 'package:quote_generator_intern/features/favorite_screen/presentation/widgets/back_to_home_button.dart';
import 'package:quote_generator_intern/features/favorite_screen/presentation/widgets/search_field.dart';

import '../../../data/model/quote_model.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key, required this.favoriteQuotes}) : super(key: key);

  final List<Quote> favoriteQuotes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackGroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BackToHomeButton(),
              const SizedBox(height: 10),
              SearchField(onChanged: (){}),
              Expanded(
                child: ListView.builder(
                  itemCount: favoriteQuotes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 2, 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.33,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: kBodyColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.14,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      favoriteQuotes[index].content,
                                      textAlign: TextAlign.justify,
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    favoriteQuotes[index].author,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: kAuthorColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
