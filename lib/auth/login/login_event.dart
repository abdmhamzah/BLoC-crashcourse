abstract class LoginEvent {}

class LoginUsernameChanged extends LoginEvent {
  final String username;

  LoginUsernameChanged(this.username);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);
}

class LoginSubmitted extends LoginEvent {}

/**
 * Setiap perubahan memiliki event tersendiri
 * Semuanya akan bisa diakses dari state
 * IF username di form berubah
 * THEN username pada LoginUsernameChanged akan berubah
 * IF password di form berubah
 * THEN password pada LoginPasswordChanged akan berubah juga
 * IF login button clicked
 * THEN event pada LoginSubmitted akan dijalankan
 */
