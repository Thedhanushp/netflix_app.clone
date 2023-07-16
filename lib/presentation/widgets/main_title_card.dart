import 'package:flutter/cupertino.dart';

import '../../core/constants.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        Kheight,
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (ctx) => const MainCard2(),
            ),
          ),
        )
      ],
    );
  }
}
