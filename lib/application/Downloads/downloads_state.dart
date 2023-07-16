part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    required List<Downloads> downloads,
    required Option<Either<MainFailures, List<Downloads>>>
        downloadsFailureOrSuccessOption,
  }) = _DownloadsState;

  factory DownloadsState.initial() {
    return DownloadsState(
      isLoading: true,
      downloadsFailureOrSuccessOption: none(),
      downloads: [],
    );
  }
}

// @immutable
// abstract class DownloadsState {}

// class DownloadsInitial extends DownloadsState {}
