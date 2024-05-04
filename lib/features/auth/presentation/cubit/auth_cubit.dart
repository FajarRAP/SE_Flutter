import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool isObsecure = false;
  bool isFilled = false;

  bool get getIsObsecure => isObsecure;
  bool get getIsFilled => isFilled;

  void revealPassword() {
    emit(RevealPassword());
    isObsecure = !isObsecure;
  }

  void loginAuth() async {
    emit(LoginAuthenticating());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoginAuthenticated());
  }
}
