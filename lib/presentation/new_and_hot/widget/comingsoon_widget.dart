import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widget/custom_button_widget.dart';

class comingsoonWidget extends StatelessWidget {
  const comingsoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "John Wick:\nChapter 4",
                    style: TextStyle(
                      letterSpacing: -2.5,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      custombuttonwidget(
                        icon: Icons.notifications,
                        title: "Remind me",
                        iconsize: 20,
                        textsize: 11,
                      ),
                      CWidth,
                      custombuttonwidget(
                        icon: Icons.info,
                        title: "Info",
                        iconsize: 20,
                        textsize: 11,
                      ),
                      CWidth,
                    ],
                  )
                ],
              ),
              kheight10,
              const Text("Coming on Friday"),
              Kheight20,
              const Text(
                "John Wick: Chapter 4",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: KwhiteColor,
                ),
              ),
              kheight10,
              Text(
                "John Wick (Keanu Reeves) uncovers a path to defeating the High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
