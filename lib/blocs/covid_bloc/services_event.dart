part of 'services_bloc.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class GetServiceList extends ServiceEvent {}

/////
////
abstract class SpecialEvent extends Equatable {
  const SpecialEvent();

  @override
  List<Object> get props => [];
}

class GetSpecialList extends SpecialEvent {}
