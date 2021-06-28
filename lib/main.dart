import 'package:BLoC_crashcourse/auth/auth_repository.dart';
import 'package:BLoC_crashcourse/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // * memfasilitasi authentifikasi yang dibutuhkan oleh aplikasi
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginView(),
      ),
    );
  }
}
