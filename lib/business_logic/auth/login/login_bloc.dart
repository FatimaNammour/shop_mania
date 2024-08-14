import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_mania/core/constant/enums.dart';

import 'package:shop_mania/data/repositories/auth_repo.dart';

import '../../../core/dio/exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;
  final form = FormGroup({
    "email": FormControl<String>(
        validators: [Validators.required, Validators.email]),
    "password": FormControl<String>(validators: [
      Validators.required,
    ]),
  });
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode sendCodeFocusNode = FocusNode();
  late CustomError error;

  final sendCodeform = FormGroup({
    "email": FormControl<String>(validators: [Validators.email]),
    "password": FormControl<String>(validators: [Validators.email]),
    "passwordRepeat": FormControl<String>(validators: [Validators.email]),
    "number": FormControl<String>(validators: [
      Validators.number(),
    ]),
  });

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = event.email;
    emit(
      state.copyWith(
        email: email,
        isValid: form.valid,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = event.password;
    emit(
      state.copyWith(
        password: password,
        isValid: form.valid,
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    log("Hi from _onSubmitted");
    log(state.isValid.toString());
    if (state.isValid) {
      emit(state.copyWith(status: SubmissionStatus.inProgress));
      try {
        await _authenticationRepository.logIn(
          email: state.email,
          password: state.password,
        );
        emit(state.copyWith(status: SubmissionStatus.success));
      } on CustomException catch (e) {
        log("Hi from catch");
        error = e.error;
        emit(state.copyWith(status: SubmissionStatus.failed));
      }
    } else {
      log("Hi from else");
      form.markAllAsTouched();
      emit(state.copyWith(status: SubmissionStatus.dataMissing));
    }
  }
}
