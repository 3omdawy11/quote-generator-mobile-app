import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator_intern/constants.dart';

class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return HeadingButton(
      widgets: [
// Leading Icon Button
        IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context, kHomeScreen);
          },
        ), // Adjust the space between icon and text
// Text Widget
        const Text(
          'Back To Home Screen',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 26,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
      borderRadius: kBorderRadius,
    );
  }
}

class HeadingButton extends StatelessWidget {
  const HeadingButton({
    super.key,
    required this.widgets, required this.borderRadius,
  });
  final List<Widget> widgets;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kHeadingColor,
          borderRadius: borderRadius
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets,
          ),
        ),
      ),
    );
  }
}
