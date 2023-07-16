import 'package:flutter/cupertino.dart';

import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTitlecard extends StatelessWidget {
  const NumberTitlecard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: "Top 10 TV Shows in India Today",
        ),
        Kheight,
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(
                index: index,
              ),
            ),
          ),
        )
      ],
    );
  }
}
