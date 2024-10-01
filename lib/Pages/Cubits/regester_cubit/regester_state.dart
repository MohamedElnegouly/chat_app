part of 'regester_cubit.dart';

@immutable
abstract class RegesterState {}

class RegesterInitial extends RegesterState {}

class RegesterSuccess extends RegesterState {}

class RegesterFaliure extends RegesterState {
  String errMessage;
  RegesterFaliure({required this.errMessage});
}

class RegesterLoading extends RegesterState {}
