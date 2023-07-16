import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

//import '../../../core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 140,
            ),
            Container(
              width: 120,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 21,
          bottom: -2,
          child: BorderedText(
            strokeWidth: 15.0,
            strokeColor: KwhiteColor,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                decorationColor: Colors.black87,
                color: Kblackcolor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
