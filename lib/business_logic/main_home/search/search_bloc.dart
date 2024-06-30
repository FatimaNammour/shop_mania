import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_mania/core/constant/enums.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(super.initialState) {
    on<SearchFieldChanged>(_onSearchFieldChanged);
    on<SearchSubmitted>(_onSubmitted);
  }
  final form = FormGroup({
    "searchText": FormControl<String>(
        validators: [Validators.required, Validators.email]),
  });

  void _onSearchFieldChanged(
    SearchFieldChanged event,
    Emitter<SearchState> emit,
  ) {
    final searchText = event.searchText;
    emit(
      state.copyWith(
        password: searchText,
        isValid: form.valid,
      ),
    );
  }

  Future<void> _onSubmitted(
    SearchSubmitted event,
    Emitter<SearchState> emit,
  ) async {
    log("Hi from _onSubmitted");
    log(state.isValid.toString());
    if (state.isValid) {
      emit(state.copyWith(status: SubmissionStatus.inProgress));
      try {
        // await _authenticationRepository.logIn(
        //   username: state.email,
        //   password: state.password,
        // );
        emit(state.copyWith(status: SubmissionStatus.success));
      } catch (_) {
        log("Hi from catch");
        emit(state.copyWith(status: SubmissionStatus.failed));
      }
    } else {
      log("Hi from else");
      form.markAllAsTouched();
      emit(state.copyWith(status: SubmissionStatus.dataMissing));
    }
  }
}
