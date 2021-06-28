import 'package:BLoC_crashcourse/auth/form_submission_status.dart';
import 'package:BLoC_crashcourse/auth/login/constants.dart';

class LoginState {
  final String username;
  final String password;
  final FormSubmissionStatus formStatus;

  LoginState({
    this.username = InitialLoginState.initialUsername,
    this.password = InitialLoginState.initialPassword,
    this.formStatus = const InitialFormStatus(),
  });

  // * copyWith akan menyalin state eksisting
  // * state juga dapat diupdate dengan data terbaru
  LoginState copyWith({
    String updatedUsername,
    String updatedPassword,
    FormSubmissionStatus updatedFormStatus,
  }) {
    return LoginState(
      username: updatedUsername ?? this.username,
      password: updatedPassword ?? this.password,
      formStatus: updatedFormStatus ?? this.formStatus,
    );
  }
}
