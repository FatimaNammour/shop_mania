part of 'register_bloc.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.status = SubmissionStatus.initial,
    this.email = "",
    this.password = "",
    this.passwordRepeat = "",
    this.username = "",
    this.number = "",
    this.isValid = false,
    this.hasFucos = false,
  });

  final SubmissionStatus status;
  final String email;
  final String password;
  final String passwordRepeat;
  final String username;
  final String number;
  final bool isValid;
  final bool hasFucos;

  RegisterState copyWith({
    SubmissionStatus? status,
    String? email,
    String? password,
    String? passwordRepeat,
    String? username,
    String? number,
    bool? isValid,
    bool? hasFocus,
  }) {
    return RegisterState(
      hasFucos: hasFocus ?? hasFucos,
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordRepeat: passwordRepeat ?? this.passwordRepeat,
      username: username ?? this.username,
      number: number ?? this.number,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props =>
      [status, username, email, password, passwordRepeat, number];
}
