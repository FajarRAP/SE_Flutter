import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:konsumsi_api_agenda/features/profile/data/data_sources/remote.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getProfile() async {
    final String response = (await ProfileService().getProfile()).body;
    print(jsonDecode(response));
  }
}
