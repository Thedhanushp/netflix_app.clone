import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widget/custom_button_widget.dart';

class comingsoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const comingsoonWidget(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
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
              VideoWidget(url: posterPath),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 4,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        //letterSpacing: -2,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const custombuttonwidget(
                    icon: Icons.notifications,
                    title: "Remind me",
                    iconsize: 22,
                    textsize: 11,
                  ),
                  CWidth,
                  const custombuttonwidget(
                    icon: Icons.info,
                    title: "Info",
                    iconsize: 22,
                    textsize: 11,
                  ),
                  CWidth
                ],
              ),
              kheight10,
              Text("Coming on $day $month"),
              Kheight20,
              Text(
                movieName,
                maxLines: 4,
                //overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: KwhiteColor,
                ),
              ),
              kheight10,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(
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
