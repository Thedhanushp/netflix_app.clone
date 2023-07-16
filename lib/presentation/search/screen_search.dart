import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widget/search_idle.dart';
import 'package:netflix_app/presentation/search/widget/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(0.3),
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: TextStyle(color: Colors.white),
          ),
          Kheight,
          Expanded(child: SearchIdleWidget()),
          //const Expanded(child: SearchResultWidget()),
        ],
      ),
    )));
  }
}
