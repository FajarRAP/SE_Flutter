part of 'cuti_cubit.dart';

@immutable
sealed class CutiState {}

final class CutiInitial extends CutiState {}

class RekapCuti extends CutiState {}

class Cuti extends CutiState {}

class RekapCutiLoading extends RekapCuti {}

class RekapCutiLoaded extends RekapCuti {
  final DataRekapCutiModel data;

  RekapCutiLoaded(this.data);
}

class RekapCutiError extends RekapCuti {
  final String message;

  RekapCutiError({required this.message});
}

class CutiLoading extends Cuti {}

class CutiLoaded extends Cuti {
  final List<DataCutiModel> data;

  CutiLoaded(this.data);
}

class CutiEmpty extends Cuti {}

class CutiError extends Cuti {
  final String message;

  CutiError({required this.message});
}
