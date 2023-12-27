import 'package:bloc/bloc.dart';
import 'package:blocmanagment/home_screen/api/product_model.dart';
import 'package:blocmanagment/home_screen/api/product_repostory.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
    });
    on<HomeLoadingDate>((event, emit) async {
      emit(HomeLoading());
      try {
        final result = await ProductRepository().getData();
        if (result != []) {
          emit(HomeSucces(productList: result));
        } else {
          emit(HomeError());
        }
      } catch (e) {
        emit(HomeError());
      }
    });
  }
}
