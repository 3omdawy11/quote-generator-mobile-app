import 'package:flutter/material.dart';
import 'package:quote_generator_intern/constants.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key, required this.onChanged});
  TextEditingController searchController = TextEditingController();
  final Function() onChanged;
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
          onChanged: (searchController) {

          },

        ),
      ),
    );
  }
}
