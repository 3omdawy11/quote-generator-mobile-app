import 'package:flutter/material.dart';
import 'package:quote_generator_intern/constants.dart';
import 'package:quote_generator_intern/features/favorite_screen/presentation/favorite_screen.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key, required list});
  TextEditingController searchController = TextEditingController();
  late List list;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: kBorderRadius,
        color: Colors.white,
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Type Something To Search..',
            //alignLabelWithHint: true,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
            )
          ),
          controller: searchController,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
            /*onTap: (){
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },*/
          onChanged: (searchController) {

          },

        ),
      ),
    );
  }
}
