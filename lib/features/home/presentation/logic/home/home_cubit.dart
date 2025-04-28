import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/features/home/domain/entity/product.dart';
import 'package:task_products/features/home/domain/usecase/get_product_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase _getProductsUseCase;

  HomeCubit({required GetProductsUseCase getProductsUseCase})
    : _getProductsUseCase = getProductsUseCase,
      super(HomeState());

  Future<void> getProducts() async {
    emit(
      state.copyWith(flowStateApp: FlowStateApp.loading, products: Products()),
    );

    final result = await _getProductsUseCase(unit);

    log(result.toString());
    result.fold(
      (failure) => emit(
        state.copyWith(flowStateApp: FlowStateApp.error, failure: failure),
      ),
      (products) => emit(
        state.copyWith(flowStateApp: FlowStateApp.normal, products: products),
      ),
    );
  }
}
