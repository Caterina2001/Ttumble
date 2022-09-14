part of 'services_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object?> get props => [];
}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceLoaded extends ServiceState {
  final ServiceModel serviceModel;
  const ServiceLoaded(this.serviceModel);
}

class ServiceError extends ServiceState {
  final String? message;
  const ServiceError(this.message);
}

////
///
///
///
abstract class SpecialState extends Equatable {
  const SpecialState();

  @override
  List<Object?> get props => [];
}

class SpecialInitial extends SpecialState {}

class SpecialLoading extends SpecialState {}

class SpecialLoaded extends SpecialState {
  final SpecialServiceModel specialModel;
  const SpecialLoaded(this.specialModel);
}

class SpecialError extends SpecialState {
  final String? messagee;
  const SpecialError(this.messagee);
}
