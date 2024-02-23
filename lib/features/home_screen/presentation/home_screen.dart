import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator_intern/constants.dart';

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
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
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
                        fontSize: 20,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Added SizedBox for spacing
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context)
                      .size
                      .width, // Changed from height to width
                  decoration: BoxDecoration(
                    color: kBodyColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(6), // Adjusted to bottomLeft
                      bottomRight:
                          Radius.circular(6), // Adjusted to bottomRight
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '“All I required to be happy was friendship and people I could admire.”',
                          textAlign: TextAlign.center, // Centered text
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.2, // Adjusted line height
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text('Christian Dior')],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Text('Generate Another Quote'),
                            ),
                            InkWell(
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.deepPurpleAccent,
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
