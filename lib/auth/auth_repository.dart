// * Dummy login authentication

class AuthRepository {
  Future<void> login() async {
    print("attemting login");
    await Future.delayed(Duration(seconds: 3));
    print("logged in");
    // * comment line code di bawah untuk menyembunyikan error login
    throw Exception('Failed to log in');
  }
}
