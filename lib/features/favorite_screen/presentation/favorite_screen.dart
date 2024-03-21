import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quote_generator_intern/constants.dart';
import 'package:quote_generator_intern/features/favorite_screen/presentation/widgets/back_to_home_button.dart';
import 'package:quote_generator_intern/features/home_screen/cached_data/quotes_entity.dart';



class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key, required this.favoriteQuotesBox}) : super(key: key);

  late Box favoriteQuotesBox;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List favoriteQuotes = [];
  late List searchingFavoriteQuotes = [];
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(widget.favoriteQuotesBox.values.toList());
    favoriteQuotes = widget.favoriteQuotesBox.values.toList();
  }

  void delete(QuoteEntity quote) {
    widget.favoriteQuotesBox.delete(quote.id);
    favoriteQuotes.remove(quote);
    setState(() {});
  }

  void searchedList(String value) {
    isSearching = true;
    setState(() {
      searchingFavoriteQuotes = favoriteQuotes
          .where((element) =>
              element.content.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackGroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BackToHomeButton(),
                const SizedBox(height: 10),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: kBorderRadius,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: searchController.text.isNotEmpty ? IconButton(
                            icon: const Icon(CupertinoIcons.xmark_circle),
                            color: Colors.grey,
                            onPressed: () {
                              isSearching = false;
                              searchController.clear();
                              searchedList('');
                            },
                          ) : null,
                          border: InputBorder.none,
                          hintText: 'Type Something To Search..',
                          //alignLabelWithHint: true,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          )),
                      controller: searchController,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                      onChanged: (value) {
                        searchedList(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: isSearching ? searchingFavoriteQuotes.length : favoriteQuotes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(2, 0, 2, 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.33,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: kBodyColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.14,
                                    child: SingleChildScrollView(
                                      child: Text(
                                        isSearching ? searchingFavoriteQuotes[index].content : favoriteQuotes[index].content,
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
                                      isSearching ? searchingFavoriteQuotes[index].author :
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
                                InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2)),
                                  onTap: () {
                                    delete(isSearching ? searchingFavoriteQuotes[index] : favoriteQuotes[index]);
                                  },
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(6)),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: myDeepPurple, width: 2)),
                                    child: const Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.heart,
                                            color: myDeepPurple,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Remove From Favorite',
                                            style: TextStyle(
                                                color: myDeepPurple,
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
      ),
    );
  }
}
