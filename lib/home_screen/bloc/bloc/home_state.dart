part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  
}
final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

// ignore: must_be_immutable
class HomeSucces extends HomeState {
  List<ProductModel> productList;
  HomeSucces({required this.productList});
}

class HomeError extends HomeState {}
