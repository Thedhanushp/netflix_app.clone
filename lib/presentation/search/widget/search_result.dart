import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widget/title.dart';

const Imageurl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/liLN69YgoovHVgmlHJ876PKi5Yi.jpg";
// //"https://www.themoviedb.org/t/p/w300_and_h450_bestv2/w46Vw536HwNnEzOa7J24YH9DPRS.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const searchTextTitle(title: 'Movies & TV'),
        Kheight,
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.4,
          children: List.generate(20, (index) {
            return const MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(Imageurl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
