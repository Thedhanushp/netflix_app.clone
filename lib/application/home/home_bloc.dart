import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new/hot_and_new_resp/hot_and_new_service.dart';

import '../../domain/hot_and_new/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewSevice _homeSevice;
  HomeBloc(this._homeSevice) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      log('GETING HOME SCREEN DATA');
      //send ui
      emit(state.copyWith(isLoading: true, hasError: false));

      //get data

      final _movieResult = await _homeSevice.getHotAndNewMovieData();
      final _tvResult = await _homeSevice.getHotAndNewTvData();

      ///transform data
      final _state1 = _movieResult.fold((MainFailures failures) {
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final trending = resp.results;
        final dramas = resp.results;
        final sounthindian = resp.results;
        pastYear.shuffle();
        trending.shuffle();
        dramas.shuffle();
        sounthindian.shuffle();
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: pastYear,
          trendingMovieList: trending,
          tenseDramasMovieList: dramas,
          southIndianMovieList: sounthindian,
          trendingTvList: state.trendingTvList,
          isLoading: false,
          hasError: false,
        );
      });
      emit(_state1);
      final _state2 = _tvResult.fold((MainFailures failures) {
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        final Top10List = resp.results;
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tenseDramasMovieList: state.tenseDramasMovieList,
          southIndianMovieList: state.southIndianMovieList,
          trendingTvList: Top10List,
          isLoading: false,
          hasError: false,
        );
      });
      //send ui
      emit(_state2);
    });
  }
}
