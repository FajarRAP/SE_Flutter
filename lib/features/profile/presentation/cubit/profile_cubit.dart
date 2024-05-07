import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/profile.dart';
import '../../data/repositories/profile_repositories_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  DataProfile? profile;

  String get getNim => profile!.nim;
  String get getNama => profile!.nama;
  String get getUnit => profile!.unit;
  String get getKodeUnit => profile!.kodeUnit;

  void getProfile() async {
    emit(ProfileLoading());

    final results = await locator<ProfileRepositoriesImpl>().getProfile();

    results.fold(
      (failure) {
        emit(ProfileError(failure.message));
      },
      (success) {
        profile = success.data;
        emit(ProfileLoaded(success.data));
      },
    );
  }
}
