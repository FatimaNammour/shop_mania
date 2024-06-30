part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.status = SubmissionStatus.initial,
    this.searchText = "",
    this.isValid = false,
  });

  final SubmissionStatus status;
  final String searchText;
  final bool isValid;

  SearchState copyWith({
    SubmissionStatus? status,
    String? searchText,
    String? password,
    bool? isValid,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchText: searchText ?? this.searchText,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
        status,
        searchText,
      ];
}
