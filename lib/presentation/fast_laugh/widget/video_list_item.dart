import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
//import 'package:netflix_app/core/constants.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w220_and_h330_face/5hKlKh62yIR03XHZxwFs3EaIFfD.jpg"),
                      ),
                    ),
                    VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    // Kheight,
                    VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    //Kheight,
                    VideoActionsWidget(icon: Icons.share, title: 'Share'),
                    // Kheight,
                    VideoActionsWidget(icon: Icons.play_arrow, title: 'Play'),
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
