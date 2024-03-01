import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator_intern/constants.dart';
import 'package:quote_generator_intern/features/favorite_screen/presentation/favorite_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackGroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, kFavoriteScreen);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context)
                        .size
                        .width, // Changed from height to width
                    decoration: BoxDecoration(
                      color: kHeadingColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Click here to view Favorite Quotes',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 26,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Added SizedBox for spacing
                Container(
                  height: MediaQuery.of(context).size.height * 0.31,
                  width: MediaQuery.of(context)
                      .size
                      .width, // Changed from height to width
                  decoration: const BoxDecoration(
                    color: kBodyColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6), // Adjusted to bottomLeft
                      bottomRight:
                          Radius.circular(6), // Adjusted to bottomRight
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '“All I required to be happy was friendship and people I could admire.”',
                          textAlign: TextAlign.justify, // Centered text
                          style: TextStyle(
                            fontSize: 26,
                            height: 1.2, // Adjusted line height
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Christian Dior',
                              style: TextStyle(fontSize: 22,
                              color: kAuthorColor,
                              fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2)),
                              child: Container(
                                height: 50,
                                width: 220,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6)),
                                  color: kButtonGeneratorColor,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Generate Another Quote',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                height: 50,
                                width: 90,
                                decoration: const BoxDecoration(
                                  border: kButtonBorder,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                  ),
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  CupertinoIcons.heart_fill,
                                  color: kFavouritingButton,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
