import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kHomeScreen = '/';
const kFavoriteScreen = 'favoriteScreen';
const BoxDecoration kBackGroundColor = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF5D13E7), Color(0xFF8249B5)]));
Color kHeadingColor = Colors.deepPurple.shade200;
Color kBodyColor = Color(0xFFFBFBFB);