import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator_intern/constants.dart';
import 'package:quote_generator_intern/data/provider/quote_provider.dart';

import '../../../data/model/quote_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  late List<Quote> favoriteList = [];
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final quoteData = ref.watch(quoteDataProvider);

    return Container(
      decoration: kBackGroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: quoteData.when(
          data: (List<Quote> data) {
            List<Quote> quoteList = data.map((e) => e).toList();
            int index = Random().nextInt(quoteList.length);
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, kFavoriteScreen,
                                arguments: widget.favoriteList);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width,
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
                        Positioned(
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                              color: Color(0xFF323232),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Center(
                              child: Text(
                                "${widget.favoriteList.length}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
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
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                child: Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      quoteList[index].content,
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
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Christian Dior',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: kAuthorColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2)),
                                  onTap: () {
                                    index =
                                        Random().nextInt(quoteList.length);
                                    setState(() {});
                                  },
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
                                  onTap: () {
                                    widget.favoriteList.add(quoteList[index]);
                                    setState(() {

                                    });
                                  },
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
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
