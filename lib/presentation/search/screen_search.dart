import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widget/search_idle.dart';
import 'package:netflix_app/presentation/search/widget/search_result.dart';

import '../../domain/downloads/core/debounce/debouce.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //!
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
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              _debouncer.run(() {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchMovie(movieQuery: value));
              });
            },
          ),
          Kheight,

          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return SearchIdleWidget();
                } else {
                  return const SearchResultWidget();
                }
              },
            ),
          ),
          // )(child: SearchIdleWidget())),//old function
          //const Expanded(child: SearchResultWidget()),
        ],
      ),
    )));
  }
}
