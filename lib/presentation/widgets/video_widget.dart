import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/constants.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          //color: Colors.red,
          child: Image(
            image: NetworkImage(newandHotTempImg),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 19,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: KwhiteColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
