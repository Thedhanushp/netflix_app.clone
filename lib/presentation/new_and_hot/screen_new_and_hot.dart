//import 'dart:js';
//import 'package:netflix_app/main.dart';

import 'package:flutter/material.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/home/widget/custom_button_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widget/Everyones_watching_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widget/comingsoon_widget.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../core/constants.dart';
//import '../widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                CWidth,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                CWidth,
              ],
              bottom: TabBar(
                unselectedLabelColor: KwhiteColor,
                labelColor: Kblackcolor,
                isScrollable: true,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                indicator: BoxDecoration(
                  color: KwhiteColor,
                  borderRadius: kradius30,
                ),
                tabs: [
                  Tab(
                    text: "🍿 Coming Soon",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryoneswatching(),
          ])),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const comingsoonWidget(),
    );
  }

  Widget _buildEveryoneswatching() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) =>
            EveryOnesWatchingWidgets());
  }
}
