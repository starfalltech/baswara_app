import 'dart:async';

import 'package:baswara_app/core/failure.dart';
import 'package:baswara_app/homeAdmin/domain/entities/alluser_entity.dart';
import 'package:baswara_app/homeAdmin/domain/entities/category_entity.dart';
import 'package:baswara_app/homeAdmin/domain/entities/checkout_body_entity.dart';
import 'package:baswara_app/homeAdmin/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/domain/entities/user_entity.dart';
import '../../domain/repositories/admin_repository.dart';

part 'admin_event.dart';

part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepository repository;

  AdminBloc(this.repository) : super(AdminInitial()) {
    on<GetProduct>(getProductMapToState);
    on<AddProduct>(addProductMapToState);
    on<DeleteProduct>(deleteProductMapToState);
    on<GetAlluser>(getAllUserMapToState);
    on<GetAllCategory>(getAllCategoryMapToState);
    on<PostCheckOut>(postCheckoutMapToState);
  }

  FutureOr<void> getProductMapToState(
      GetProduct event, Emitter<AdminState> emit) async {
    emit(LoadingAdminState());
    final data = await repository.getProduct();
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureAdminState(l.msg));
        }
        if (l is InternalFailure) {
          emit(NoConnection());
        }
      },
      (r) => emit(
        SuccesGetProduct(r),
      ),
    );
  }

  FutureOr<void> addProductMapToState(
      AddProduct event, Emitter<AdminState> emit) async {
    emit(LoadingAdminState());
    final data = await repository.addProduct(event.name, event.category);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureAdminState(l.msg));
        }
        if (l is InternalFailure) {
          emit(NoConnection());
        }
      },
      (r) => emit(
        SuccesProductCRUD(),
      ),
    );
  }

  FutureOr<void> deleteProductMapToState(
      DeleteProduct event, Emitter<AdminState> emit) async {
    emit(LoadingAdminState());
    final data = await repository.deleteProduct(event.idProduct);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureAdminState(l.msg));
        }
        if (l is InternalFailure) {
          emit(NoConnection());
        }
      },
      (r) => emit(
        SuccesProductCRUD(),
      ),
    );
  }

  FutureOr<void> getAllUserMapToState(
      GetAlluser event, Emitter<AdminState> emit) async {
    emit(LoadingAdminState());
    final data = await repository.getAllUser();
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureAdminState(l.msg));
        }
        if (l is InternalFailure) {
          emit(NoConnection());
        }
      },
      (r) => emit(
        SuccesGetAllUser(r),
      ),
    );
  }

  FutureOr<void> getAllCategoryMapToState(
      GetAllCategory event, Emitter<AdminState> emit) async {
    emit(LoadingAdminState());
    final data = await repository.getAllCategory();
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureAdminState(l.msg));
        }
        if (l is InternalFailure) {
          emit(NoConnection());
        }
      },
      (r) => emit(
        SuccesGetAllCategory(r),
      ),
    );
  }

  FutureOr<void> postCheckoutMapToState(
      PostCheckOut event, Emitter<AdminState> emit) async {
    emit(LoadingAdminState());
    final data = await repository.potCheckout(event.body);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureAdminState(l.msg));
        }
        if (l is InternalFailure) {
          emit(NoConnection());
        }
      },
      (r) => emit(
        SuccesPostCheckout(),
      ),
    );
  }
}
