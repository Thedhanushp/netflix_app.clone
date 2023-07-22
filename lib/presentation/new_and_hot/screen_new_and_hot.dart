// import 'dart:js';
// import 'package:netflix_app/main.dart';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:netflix_app/core/colors/colors.dart';
//import 'package:netflix_app/presentation/home/widget/custom_button_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widget/Everyones_watching_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widget/comingsoon_widget.dart';
//import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../application/hot_and_new/hot_and_new_bloc.dart';
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
          body: const TabBarView(children: [
            ComingsoonList(
              key: Key('coming_soon'),
            ),
            EvertOneIsWatchingList(key: Key('everyone_is_watching')),
          ])),
    );
  }
}
//  OLD UI
//   // Widget _buildComingSoon() {
//   //   return ListView.builder(
//   //     itemCount: 10,
//   //     itemBuilder: (BuildContext context, index) =>  comingsoonWidget(),
//   //   );
//   // }

//   Widget _buildEveryoneswatching() {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (BuildContext context, index) => SizedBox(),
//       //EveryOnesWatchingWidgets(),
//     );
//   }
// }

class ComingsoonList extends StatelessWidget {
  const ComingsoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while loading coming soon list'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('comingsoon list is empty'),
            );
          } else {
            return ListView.builder(
                //padding: const EdgeInsets.all(15),

                itemCount: state.comingSoonList.length,
                padding: const EdgeInsets.only(top: 15),
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  log(movie.releaseDate.toString());
                  String month = '';
                  String date = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    log(formatedDate.toString());
                    month = formatedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }

                  return comingsoonWidget(
                      id: movie.id.toString(),
                      month: month,
                      day: date,
                      posterPath: '$imageAppentUrl${movie.posterPath}',
                      movieName: movie.originalTitle ?? 'No title',
                      description: movie.overview ?? 'No discription');
                });
          }
        },
      ),
    );
  }
}

//every ones watiching class
class EvertOneIsWatchingList extends StatelessWidget {
  const EvertOneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while loading coming soon list'),
            );
          } else if (state.everyOneIswatchingList.isEmpty) {
            return const Center(
              child: Text('comingsoon list is empty'),
            );
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: state.everyOneIswatchingList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  // log(movie.releaseDate.toString());
                  // String month = '';
                  // String date = '';
                  // try {
                  //   final _date = DateTime.tryParse(movie.releaseDate!);
                  //   final formatedDate =
                  //       DateFormat.yMMMMd('en_US').format(_date!);
                  //   log(formatedDate.toString());
                  //   month = formatedDate
                  //       .split(' ')
                  //       .first
                  //       .substring(0, 3)
                  //       .toUpperCase();
                  //   date = movie.releaseDate!.split('-')[1];
                  // } catch (_) {
                  //   month = '';
                  //   date = '';
                  // }
                  final tv = state.everyOneIswatchingList[index];
                  return EveryOnesWatchingWidgets(
                      posterPath: '$imageAppentUrl${tv.posterPath}',
                      movieName: tv.originalName ?? 'No name provider',
                      description: tv.overview ?? 'No Describstion');
                });
          }
        },
      ),
    );
  }
}
