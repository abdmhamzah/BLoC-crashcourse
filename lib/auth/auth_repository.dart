// * Dummy login authentication

class AuthRepository {
  Future<void> login() async {
    print("attemting login");
    Future.delayed(Duration(seconds: 3));
    print("logged in");
  }
}
