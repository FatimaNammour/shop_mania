import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_mania/core/constant/enums.dart';
import 'package:shop_mania/core/dio/exceptions.dart';
import 'package:shop_mania/core/utils/regular_expresion.dart';
import 'package:shop_mania/data/repositories/auth_repo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const RegisterState()) {
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterUsernameChanged>(_onUserNameChanged);
    on<RegisterPasswordRepeatChanged>(_onPasswordRepeatChanged);
    on<RegisterNumberChanged>(_onNumberChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;
  final form = FormGroup({
    "username": FormControl<String>(validators: [
      Validators.required,
      Validators.pattern(RegularExp.username, validationMessage: "pattern"),
    ]),
    "email": FormControl<String>(
        validators: [Validators.required, Validators.email]),
    "phoneNumber": FormControl<String>(validators: [
      Validators.required,
    ]),
    "password": FormControl<String>(validators: [
      Validators.required,
    ]),
    "passwordRepeat": FormControl<String>(validators: [
      Validators.required,
    ]),
  });

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode numberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode repeatPasswordFocusNode = FocusNode();
  late CustomError error;

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = event.email;
    emit(
      state.copyWith(
        email: email,
        hasFocus: emailFocusNode.hasFocus,
        isValid: form.valid,
      ),
    );
  }

  void _onUserNameChanged(
    RegisterUsernameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final username = event.username;
    log("hhhhhhhhhhhi from onUserNAmeChanged ${event.username}");
    emit(
      state.copyWith(
        username: username,
        hasFocus: usernameFocusNode.hasFocus,
        isValid: form.valid,
      ),
    );
    log("state from username is $state");
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = event.password;
    emit(
      state.copyWith(
        password: password,
        hasFocus: passwordFocusNode.hasFocus,
        isValid: form.valid,
      ),
    );
  }

  void _onPasswordRepeatChanged(
    RegisterPasswordRepeatChanged event,
    Emitter<RegisterState> emit,
  ) {
    final passwordRepeat = event.passwordRepeat;
    emit(
      state.copyWith(
        passwordRepeat: passwordRepeat,
        hasFocus: repeatPasswordFocusNode.hasFocus,
        isValid: form.valid,
      ),
    );
  }

  void _onNumberChanged(
    RegisterNumberChanged event,
    Emitter<RegisterState> emit,
  ) {
    final number = event.number;
    emit(
      state.copyWith(
        number: number,
        hasFocus: numberFocusNode.hasFocus,
        isValid: form.valid,
      ),
    );
  }

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    log("hiiiiii _onSubmittedddddddddd");
    log(state.toString());
    log("state of formmmm ${form.valid}");
    log("state of formmmm ${form.controls.values.first.value}");
    // log(state.isValid.toString());
    if (form.valid) {
      emit(state.copyWith(status: SubmissionStatus.inProgress));
      try {
        await _authenticationRepository.register(
          email: state.email,
          name: state.username,
          password: state.password,
          number: int.parse(state.number),
          passwordRepeat: state.passwordRepeat,
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
