import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/search/widget/title.dart';

import '../../../core/constants.dart';

// const imageurl =
//     "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/fEe2csLOUsTyaLdCccVJfFeJzhx.jpg";

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const searchTextTitle(title: "Top Searches"),
        Kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error While getting data'),
                );
              } else if (state.idelList.isEmpty) {
                return const Center(
                  child: Text('List is empty'),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final movie = state.idelList[index];
                  return TopSearchItemTile(
                      title: movie.title ?? 'No title provider',
                      imageUrl: '$imageAppentUrl${movie.posterPath}');
                },
                separatorBuilder: (ctx, index) => Kheight20,
                itemCount: state.idelList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.36,
          height: 72,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
            color: KwhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )),
        CircleAvatar(
          backgroundColor: KwhiteColor,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: Kblackcolor,
            radius: 20,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: KwhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
