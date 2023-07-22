import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widget/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryOnesWatchingWidgets extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryOnesWatchingWidgets(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
        Text(
          movieName,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: KwhiteColor,
          ),
        ),
        kheight10,
        CWidth,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        kheight50,
        VideoWidget(
          url: posterPath,
        ),
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
}
