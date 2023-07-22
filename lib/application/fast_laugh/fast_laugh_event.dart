part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initilize() = Initilize;
  const factory FastLaughEvent.likeVideo({required int id}) = LikeVideo;
  const factory FastLaughEvent.unLikeVideo({required int id}) = UnLikeVideo;
}
