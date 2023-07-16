part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<searchResultData> searchResultList,
    required List<Downloads> idelList,
    required bool isloading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
      searchResultList: [], idelList: [], isloading: false, isError: false);
}
