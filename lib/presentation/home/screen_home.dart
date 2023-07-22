//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
//import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widget/background_card.dart';
//import 'package:netflix_app/presentation/home/widget/custom_button_widget.dart';
//import 'package:netflix_app/presentation/home/widget/number_card.dart';
import 'package:netflix_app/presentation/home/widget/number_title_card.dart';
//import 'package:netflix_app/presentation/search/widget/search_result.dart';
//import 'package:netflix_app/presentation/widgets/main_card.dart';
//import 'package:netflix_app/presentation/widgets/main_title.dart';
//import 'package:netflix_app/presentation/widgets/main_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });

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
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.hasError) {
                          return const Center(
                              child: Text(
                            'Error while geting Data',
                            style: TextStyle(color: Colors.white),
                          ));
                        }
                        //realeased pastyear
                        final _releasedPastYear =
                            state.pastYearMovieList.map((m) {
                          return '$imageAppentUrl${m.posterPath}';
                        }).toList();
                        //trending
                        final _trending = state.trendingMovieList.map((m) {
                          return '$imageAppentUrl${m.posterPath}';
                        }).toList();
                        //tensedramas
                        final _tensedramas =
                            state.tenseDramasMovieList.map((m) {
                          return '$imageAppentUrl${m.posterPath}';
                        }).toList();
                        //sounthindian movies
                        final _sounthindians =
                            state.southIndianMovieList.map((m) {
                          return '$imageAppentUrl${m.posterPath}';
                        }).toList();
                        //top 10 tv shows
                        final _top10tvshows = state.trendingTvList.map((t) {
                          return '$imageAppentUrl${t.posterPath}';
                        }).toList();
                        //main page
                        // final _mainPage = state.pastYearMovieList.map((e) {
                        //   return '$imageAppentUrl${e.posterPath}';
                        // }).toList();

                        _releasedPastYear.shuffle();
                        _trending.shuffle();
                        _tensedramas.shuffle();
                        _sounthindians.shuffle();
                        _top10tvshows.shuffle();

                        //Listview.
                        return ListView(
                          children: [
                            const BackgroundCard(),
                            Kheight,
                            MainTitleCard(
                              title: "Released in the past year",
                              posterList:
                                  _releasedPastYear, //use sublist decrease the length of data.
                            ),
                            Kheight,
                            MainTitleCard(
                              title: "Trending Now",
                              posterList: _trending,
                            ),
                            Kheight,
                            NumberTitlecard(
                              postersList: _top10tvshows,
                            ),
                            Kheight,
                            MainTitleCard(
                              title: "Tense Dramas",
                              posterList: _tensedramas,
                            ),
                            Kheight,
                            MainTitleCard(
                              title: "South Indian Cinema",
                              posterList: _sounthindians,
                            ),
                          ],
                        );
                      },
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 85,
                            color: Colors.black.withOpacity(0.2),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      netflixLogo,
                                      width: 75,
                                      height: 55,
                                      colorBlendMode: BlendMode.lighten,
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
