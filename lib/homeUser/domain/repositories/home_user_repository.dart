import 'dart:io';

import 'package:baswara_app/core/failure.dart';
import 'package:baswara_app/homeUser/domain/entities/catalog_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/home_user_entity.dart';

abstract class HomeUserRepository {
  Future<Either<Failure, HomeUserEntity>> getUserProfile();
  Future<Either<Failure, CatalogEntity>> getCatalogUser();

  Future<Either<Failure, bool>> updateUserProfile({
    required String name,
    required String noHp,
    required String email,
    required File? image,
  });
}
