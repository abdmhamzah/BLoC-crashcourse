import 'package:BLoC_crashcourse/auth/auth_repository.dart';
import 'package:BLoC_crashcourse/auth/form_submission_status.dart';
import 'package:BLoC_crashcourse/auth/login/constants.dart';
import 'package:BLoC_crashcourse/auth/login/login_bloc.dart';
import 'package:BLoC_crashcourse/auth/login/login_event.dart';
import 'package:BLoC_crashcourse/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  // * top state yang dapat mengirimkan state dari semua form
  // * kalo ga ada ini ga akan bisa validasi dari setiap textformfield
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        // * memfasilitasi login view dengan login bloc
        // * login bloc spesifik membaca logic dari authrepo
        create: (context) => LoginBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _usernameField(),
              _passwordField(),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: "Username",
        ),
        // * tahapannya:
        // * read dari login bloc
        // * kemudian add value sesuai value yang diketik user
        onChanged: (value) => {
          context.read<LoginBloc>().add(LoginUsernameChanged(value)),
        },
        validator: (value) =>
            state.isValidUsername ? null : ErrorMessage.minimumUsernameLength,
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.security),
          hintText: "Password",
        ),
        onChanged: (value) => {
          context.read<LoginBloc>().add(LoginPasswordChanged(value)),
        },
        validator: (value) =>
            state.isValidPassword ? null : ErrorMessage.minimumPasswordLength,
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                }
              },
              child: Text("Login"),
            );
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
