import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new/hot_and_new_resp/hot_and_new_service.dart';

import '../../domain/hot_and_new/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@Injectable()
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewSevice _hotAndNewSevice;
  HotAndNewBloc(this._hotAndNewSevice) : super(HotAndNewState.initial()) {
    //get hot and new movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIswatchingList: [],
          isLoading: true,
          hasError: false));
      //get data from remote
      final _result = await _hotAndNewSevice.getHotAndNewMovieData();

      ///data to state
      final newstate = _result.fold((MainFailures failture) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIswatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            comingSoonList: resp.results,
            everyOneIswatchingList: state.everyOneIswatchingList,
            isLoading: false,
            hasError: false);
      });
      emit(newstate);
    });
    // get hot and new tv data.
    on<LoadDataInEveryOneIsWatching>((event, emit) async {
      //get hot and new movie data
      //on<LoadDataInComingSoon>((event, emit) async { //function
      //send loading to ui
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIswatchingList: [],
          isLoading: true,
          hasError: false));
      //get data from remote
      final _result = await _hotAndNewSevice.getHotAndNewTvData();

      ///data to state
      final newstate = _result.fold((MainFailures failture) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIswatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyOneIswatchingList: resp.results,
            isLoading: false,
            hasError: false);
      });
      emit(newstate);
    });
  }
}
