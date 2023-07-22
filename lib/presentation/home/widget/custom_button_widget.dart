import 'package:flutter/cupertino.dart';

import '../../../core/colors/colors.dart';

class custombuttonwidget extends StatelessWidget {
  const custombuttonwidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconsize = 30,
    this.textsize = 18,
  });
  final IconData icon;
  final String title;
  final double iconsize;
  final double textsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: KwhiteColor,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textsize,
          ),
        ),
      ],
    );
  }
}
