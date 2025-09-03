
part of 'search_bloc.dart';
enum SearchStatus { empty, loading, loaded, error, noResults }
class SearchState extends Equatable {
  const SearchState({
    this.searchResults = const [],
    this.status = SearchStatus.empty,
    this.message = '',

  });
   final List<MpSearch> searchResults;
  final SearchStatus status;
  final String message;


  @override
  List<Object> get props => [searchResults, status, message];

  SearchState copyWith({
    List<MpSearch>? searchResults,
    SearchStatus? status,
    String? message,
  }) {
    return SearchState(
      searchResults: searchResults ?? this.searchResults,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}


