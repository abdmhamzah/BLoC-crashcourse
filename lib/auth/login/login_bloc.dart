import 'package:BLoC_crashcourse/auth/auth_repository.dart';
import 'package:BLoC_crashcourse/auth/form_submission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BLoC_crashcourse/auth/login/login_event.dart';
import 'package:BLoC_crashcourse/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({this.authRepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // * Username Updated
    if (event is LoginUsernameChanged) {
      yield state.copyWith(updatedUsername: event.username);
    }

    // * Password Updated
    else if (event is LoginPasswordChanged) {
      yield state.copyWith(updatedPassword: event.password);
    }

    // * Form Submitted
    else if (event is LoginSubmitted) {
      yield state.copyWith(updatedFormStatus: FormSubmitting());

      try {
        authRepo.login();
        yield state.copyWith(updatedFormStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(updatedFormStatus: SubmissionFailed(e));
      }
    }
  }
}
