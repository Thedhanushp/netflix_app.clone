import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';

class MainCard2 extends StatelessWidget {
  const MainCard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 07),
      width: 132,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: kRadius20,
        image: const DecorationImage(
          image: NetworkImage(
            "https://www.themoviedb.org/t/p/w220_and_h330_face/cZ0d3rtvXPVvuiX22sP79K3Hmjz.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
