import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widget/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

Column EveryOnesWatchingWidgets() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      kheight10,
      Text(
        "Friends",
        style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
          color: KwhiteColor,
        ),
      ),
      kheight10,
      CWidth,
      Text(
        "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work,life and love in 1990s manhattan.",
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
      kheight50,
      const VideoWidget(),
      Kheight,
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          custombuttonwidget(
            icon: Icons.share,
            title: "Share",
            iconsize: 25,
            textsize: 11,
          ),
          SizedBox(
            width: 20,
          ),
          custombuttonwidget(
            icon: Icons.add,
            title: "Add",
            iconsize: 25,
            textsize: 11,
          ),
          SizedBox(
            width: 20,
          ),
          custombuttonwidget(
            icon: Icons.play_arrow,
            title: "Play",
            iconsize: 30,
            textsize: 11,
          ),
          CWidth,
        ],
      )
    ],
  );
}
