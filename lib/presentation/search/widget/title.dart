import 'package:flutter/cupertino.dart';

class searchTextTitle extends StatelessWidget {
  final String title;
  const searchTextTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
