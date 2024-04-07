part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class RegisterPasswordRepeatChanged extends RegisterEvent {
  const RegisterPasswordRepeatChanged(this.passwordRepeat);

  final String passwordRepeat;

  @override
  List<Object> get props => [passwordRepeat];
}

final class RegisterUsernameChanged extends RegisterEvent {
  const RegisterUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class RegisterNumberChanged extends RegisterEvent {
  const RegisterNumberChanged(this.number);
  final String number;

  @override
  List<Object> get props => [number];
}

final class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}
