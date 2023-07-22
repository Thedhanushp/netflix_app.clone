import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    // required this.index,
    // required this.imageUrl,
    // required this.posterList,
    super.key,
  });
  // final int index;
  // final List<String> posterList;
  // final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 640,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              Kmainimage,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
      const Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              custombuttonwidget(
                title: "My List",
                icon: Icons.add,
              ),
              _playbutton(),
              custombuttonwidget(
                icon: Icons.info,
                title: "Info",
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class _playbutton extends StatelessWidget {
  const _playbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(KwhiteColor)),
      icon: const Icon(
        Icons.play_arrow,
        size: 22,
        color: Kblackcolor,
      ),
      label: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(fontSize: 18, color: Kblackcolor),
        ),
      ),
    );
  }
}
