

import 'package:flutter/material.dart';



// Screens
const kHomeScreen = '/';

const kFavoriteScreen = 'favoriteScreen';
//-----------------------------


// Decoration Constants
const BoxDecoration kBackGroundColor = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF5D13E7), myDeepPurple],
  ),
);
//----------------------------
Color myLightPurple = Colors.deepPurple.shade200;
const Color myDeepPurple = Color(0xFF8249B5);
const Color kButtonGeneratorColor = myDeepPurple;
const Color kFavouritingButton = myDeepPurple;
Color kHeadingColor = myLightPurple;
const Color kAuthorColor = Color(0xFF323232B2);
const Color kBodyColor = Color(0xFFFBFBFB);

const BorderSide kButtonBorderSide = BorderSide(
  width: 2,
  color: Color(0xFF8249B5),
);

const Border kButtonBorder = Border(
    top: kButtonBorderSide,
    left: kButtonBorderSide,
    right: kButtonBorderSide,
    bottom: kButtonBorderSide,
);

const BorderRadius kBorderRadius  = BorderRadius.only(
topLeft: Radius.circular(6),
topRight: Radius.circular(6),
bottomLeft: Radius.circular(6),
bottomRight: Radius.circular(6)
);
