part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchFieldChanged extends SearchEvent {
  const SearchFieldChanged(this.searchText);

  final String searchText;

  @override
  List<Object> get props => [searchText];
}

final class SearchSubmitted extends SearchEvent {}
