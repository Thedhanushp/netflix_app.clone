import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/search/search_service.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/models/search_responce/search_responce.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IdownloadRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadsService)
      : super(SearchState.initial()) {
/*
  idle state
*/
    on<Initialize>((event, emit) async {
      if (state.idelList.isNotEmpty) {
        emit(
          SearchState(
            searchResultList: [],
            idelList: state.idelList,
            isloading: false,
            isError: false,
          ),
        );
        return;
      }

      //get tranding
      final _result = await _downloadsService.getDownloadsImage();
      final _State = _result.fold((MainFailures f) {
        return const SearchState(
            searchResultList: [],
            idelList: [],
            isloading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
          searchResultList: [],
          idelList: list,
          isloading: false,
          isError: false,
        );
      });
      //show to ui
      emit(_State);
    });
/*
  search result state
*/
    on<SearchMovie>((event, emit) {
      //call search movie api
      _searchService.searchMovies(movieQuery: event.movieQuery);
      //show to ui
    });
  }
}
