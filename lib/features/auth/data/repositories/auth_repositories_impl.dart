import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'package:konsumsi_api_agenda/core/failure.dart';

import '../../domain/repositories/auth_repositories.dart';
import '../data_sources/remote.dart';
import '../models/authenticated.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final AuthService authService;

  AuthRepositoriesImpl({required this.authService});
  @override
  Future<Either<Failure, Authenticated>> authLogin(Map<String, String> body) async {
    try {
      final Response response = await authService.authLogin(body);
      final Map<String, dynamic> decoded = jsonDecode(response.body);
      switch (decoded['code']) {
        case "00":
          return Right(authFromJson(response.body));
        default:
          return Left(Failure(message: decoded['message']));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
