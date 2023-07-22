import 'package:flutter/material.dart';

///import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

import '../../../domain/downloads/models/downloads.dart';
//import 'package:netflix_app/core/constants.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads moveiData;

  const VideoListItemInheritedWidget({
    super.key,
    required this.widget,
    required this.moveiData,
  }) : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.moveiData != moveiData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterpath =
        VideoListItemInheritedWidget.of(context)?.moveiData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        // Container(
        //   color: Colors.accents[index % Colors.accents.length],
        // ),
        FastLaughVideoPlayer(videoUrl: videoUrl, onstatechanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: KwhiteColor,
                      size: 27,
                    ),
                  ),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: posterpath == null
                            ? null
                            : NetworkImage('$imageAppentUrl$posterpath'),
                        // "https://www.themoviedb.org/t/p/w220_and_h330_face/5hKlKh62yIR03XHZxwFs3EaIFfD.jpg"
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: likedVideosIdsNotifier,
                        builder: (BuildContext c, Set<int> newLikedListIds,
                            Widget? _) {
                          final _index = index;
                          if (newLikedListIds.contains(_index)) {
                            return GestureDetector(
                                onTap: () {
                                  // BlocProvider.of<FastLaughBloc>(context)
                                  //.add(UnLikeVideo(id: _index));
                                  likedVideosIdsNotifier.value.remove(_index);
                                  likedVideosIdsNotifier.notifyListeners();
                                },
                                child: const VideoActionsWidget(
                                    icon: Icons.favorite_outline,
                                    title: 'Like'));
                          }

                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(LikeVideo(id: _index));
                              likedVideosIdsNotifier.value.add(_index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                                icon: Icons.emoji_emotions, title: 'LOL'),
                          );
                        }),
                    // Kheight,
                    const VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    //Kheight,
                    GestureDetector(
                        onTap: () {
                          final movieName =
                              VideoListItemInheritedWidget.of(context)
                                  ?.moveiData
                                  .posterPath;
                          if (movieName != null) {
                            Share.share(movieName);
                          }
                        },
                        child: VideoActionsWidget(
                            icon: Icons.share, title: 'Share')),
                    // Kheight,
                    const VideoActionsWidget(
                        icon: Icons.play_arrow, title: 'Play'),
                    //Kheight,
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: KwhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(color: KwhiteColor, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlayed) onstatechanged;
  const FastLaughVideoPlayer(
      {required this.videoUrl, required this.onstatechanged, super.key});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
