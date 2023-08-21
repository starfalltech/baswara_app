part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AdminInitial extends AdminState {}

class LoadingAdminState extends AdminState {}

class SuccesGetProduct extends AdminState {
  final List<Product> data;

  SuccesGetProduct(this.data);
}

class SuccesPostCheckout extends AdminState {}

class SuccesGetAllUser extends AdminState {
  final List<Data> data;

  SuccesGetAllUser(this.data);
}

class SuccesGetAllCategory extends AdminState {
  final List<DataCategory> data;

  SuccesGetAllCategory(this.data);
}

class SuccesUpdateHarga extends AdminState {}

class SuccesProductCRUD extends AdminState {}

class FailureAdminState extends AdminState {
  final String msg;

  FailureAdminState(this.msg);
}

class NoConnection extends AdminState {}
