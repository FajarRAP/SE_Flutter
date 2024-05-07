part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final DataProfile data;

  ProfileLoaded(this.data);
}
class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
