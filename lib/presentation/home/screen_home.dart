import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widget/background_card.dart';
import 'package:netflix_app/presentation/home/widget/custom_button_widget.dart';
import 'package:netflix_app/presentation/home/widget/number_card.dart';
import 'package:netflix_app/presentation/home/widget/number_title_card.dart';
import 'package:netflix_app/presentation/search/widget/search_result.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: const [
                        BackgroundCard(),
                        Kheight,
                        MainTitleCard(
                          title: "Released in the past year",
                        ),
                        Kheight,
                        MainTitleCard(
                          title: "Trending Now",
                        ),
                        Kheight,
                        NumberTitlecard(),
                        Kheight,
                        MainTitleCard(
                          title: "Tense Dramas",
                        ),
                        Kheight,
                        MainTitleCard(
                          title: "South Indian Cinema",
                        ),
                      ],
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 95,
                            color: Colors.black.withOpacity(0.8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      "https://cdn.vox-cdn.com/thumbor/sW5h16et1R3au8ZLVjkcAbcXNi8=/0x0:3151x2048/2000x1333/filters:focal(1575x1024:1576x1025)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png",
                                      width: 73,
                                      height: 60,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 27,
                                    ),
                                    CWidth,
                                    Container(
                                      width: 27,
                                      height: 27,
                                      color: Colors.blue,
                                    ),
                                    CWidth,
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "TV Shows",
                                      style: Khometitletext,
                                    ),
                                    Text(
                                      "Movies",
                                      style: Khometitletext,
                                    ),
                                    Text(
                                      "Categories",
                                      style: Khometitletext,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : Kheight,
                  ],
                ),
              );
            }));
  }
}
