part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {}

class Homeerror extends HomeState {}