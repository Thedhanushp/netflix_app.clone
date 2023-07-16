import 'dart:math';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/Downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _Widgets = [
    const _smartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          ),
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _Widgets[index],
            separatorBuilder: (ctx, index) => SizedBox(
                  height: 30,
                ),
            itemCount: _Widgets.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  // final List imageList = [
  //   "https://www.themoviedb.org/t/p/w220_and_h330_face/cZ0d3rtvXPVvuiX22sP79K3Hmjz.jpg",
  //   "https://www.themoviedb.org/t/p/w220_and_h330_face/Af4bXE63pVsb2FtbW8uYIyPBadD.jpg",
  //   "https://www.themoviedb.org/t/p/w220_and_h330_face/fiVW06jE7z9YnO4trhaMEdclSiC.jpg"
  // ];
  @override
  Widget build(BuildContext context) {
    //calling Api
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImage());
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: KwhiteColor,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        Kheight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you,so there's\nalways something to watch on your\ndevice ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
        Kheight,
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, State) {
          return SizedBox(
            width: size.width,
            height: size.height,
            child: State.isLoading
                ? const Center(child: const CircularProgressIndicator())
                : Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: size.width * 0.39,
                              backgroundColor:
                                  Color.fromARGB(255, 141, 139, 139)
                                      .withOpacity(0.5),
                            ),
                          ),
                          DownloadsimageWidget(
                            imageList:
                                '$imageAppentUrl${State.downloads[0].posterPath}',
                            margin: EdgeInsets.only(
                              left: 113,
                              right: 18,
                              bottom: 10,
                              top: 10,
                            ),
                            angle: 21,
                            size: Size(size.width * 0.33, size.height * 0.24),
                          ),
                          DownloadsimageWidget(
                            imageList:
                                '$imageAppentUrl${State.downloads[1].posterPath}',
                            margin: EdgeInsets.only(
                              right: 115,
                              left: 18,
                              bottom: 10,
                              top: 10,
                            ),
                            angle: -21,
                            size: Size(size.width * 0.33, size.height * 0.24),
                          ),
                          DownloadsimageWidget(
                            imageList:
                                '$imageAppentUrl${State.downloads[2].posterPath}',
                            radius: 10,
                            margin: EdgeInsets.only(bottom: 10),
                            size: Size(size.width * 0.38, size.height * 0.27),
                          )
                        ],
                      ),
                    ],
                  ),
          );
        }),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: KbuttoncolorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                  color: KwhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Kheight,
        MaterialButton(
          color: KwhiteColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See What you can download",
              style: TextStyle(
                color: Kblackcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CWidth,
        Icon(
          Icons.settings,
          color: KwhiteColor,
        ),
        CWidth,
        Text("Smart Download"),
      ],
    );
  }
}

class DownloadsimageWidget extends StatelessWidget {
  const DownloadsimageWidget({
    super.key,
    //required this.size,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  //final Size size;
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover, //for image cerve
              image: NetworkImage(imageList),
            ),
          ),
        ),
      ),
    );
  }
}
