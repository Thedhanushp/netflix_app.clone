import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

import '../../domain/downloads/i_downloads_repo.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IdownloadRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initilize>((event, emit) async {
      emit(
        //sending loading to ui
        FastLaughState(
          videosList: [],
          isloading: true,
          isError: false,
        ),
      );
      //get tranding movies
      final _result = await _downloadService.getDownloadsImage();
      final _state = _result.fold(
        (l) {
          return FastLaughState(
            videosList: [],
            isloading: false,
            isError: true,
          );
        },
        (resp) => FastLaughState(
          videosList: resp,
          isloading: false,
          isError: false,
        ),
      );

      //send to ui
      emit(_state);
    });
    on<LikeVideo>((event, emit) {
      likedVideosIdsNotifier.value.add(event.id);
    });
    on<UnLikeVideo>((event, emit) {
      likedVideosIdsNotifier.value.remove(event.id);
    });
  }
}
