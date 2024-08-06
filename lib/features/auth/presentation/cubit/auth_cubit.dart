import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../injection_container.dart';
import '../../data/models/authenticated.dart';
import '../../data/repositories/auth_repositories_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Authenticated? authenticated;
  bool isObsecure = false;
  bool isFilled = false;
  String username = '';
  String password = '';

  bool get getIsObsecure => isObsecure;
  bool get getIsFilled => isFilled;

  set setUsername(final String username) => this.username = username;
  set setPassword(final String password) => this.password = password;

  void revealPassword() {
    emit(RevealPassword());
    isObsecure = !isObsecure;
  }

  void loginAuth(final String username, final String password) async {
    emit(LoginAuthenticating());

    final results = await locator<AuthRepositoriesImpl>()
        .authLogin({'login': username, 'password': password});

    results.fold(
      (failure) {
        emit(LoginError(failure.message));
      },
      (success) async {
        final prefs = locator<SharedPreferences>();
        await prefs.setString('token', success.data.accessToken);
        emit(LoginAuthenticated());
      },
    );
  }

  void activateButton() {
    if (username.isNotEmpty && password.isNotEmpty) {
      isFilled = true;
    } else {
      isFilled = false;
    }
    emit(ButtonTurned());
  }
}
