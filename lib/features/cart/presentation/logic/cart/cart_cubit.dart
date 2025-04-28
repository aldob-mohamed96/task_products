import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/error/failure.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';
import 'package:task_products/features/cart/domain/entity/cart_item.dart';
import 'package:task_products/features/cart/domain/usecase/add_item_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/clear_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/delete_item_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/get_all_items_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/get_cart_count_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/get_item_cart_usecase.dart';
import 'package:task_products/features/cart/domain/usecase/update_item_cart_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddItemToCartUseCase _addItemToCartUseCase;
  final ClearCartUseCase _clearCartUseCase;
  final DeleteItemFromCartUseCase _deleteItemFromCartUseCase;
  final GetAllItemsFromCartUseCase _getAllItemsFromCartUseCase;
  final GetCartCountsUseCase _getCartCountsUseCase;
  final GetItemFromCartUseCase _getItemFromCartUseCase;
  final UpdateItemCartUseCase _updateItemCartUseCase;

  CartCubit({
    required AddItemToCartUseCase addItemToCartUseCase,
    required ClearCartUseCase clearCartUseCase,
    required DeleteItemFromCartUseCase deleteItemFromCartUseCase,
    required GetAllItemsFromCartUseCase getAllItemsFromCartUseCase,
    required GetCartCountsUseCase getCartCountsUseCase,
    required GetItemFromCartUseCase getItemFromCartUseCase,
    required UpdateItemCartUseCase updateItemCartUseCase,
  }) : _addItemToCartUseCase = addItemToCartUseCase,
       _clearCartUseCase = clearCartUseCase,
       _deleteItemFromCartUseCase = deleteItemFromCartUseCase,
       _getAllItemsFromCartUseCase = getAllItemsFromCartUseCase,
       _getCartCountsUseCase = getCartCountsUseCase,
       _getItemFromCartUseCase = getItemFromCartUseCase,
       _updateItemCartUseCase = updateItemCartUseCase,
       super(const CartState());

  Future<void> addItemToCart(CartItem item) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loadingInsert));

    final result = await _addItemToCartUseCase(item);

    result.fold(
      (failure) => emit(
        state.copyWith(
          flowStateApp: FlowStateApp.notInserted,
          failure: failure,
        ),
      ),
      (count) => emit(
        state.copyWith(
          flowStateApp: FlowStateApp.successInserting,
          countCart: count,
        ),
      ),
    );
  }

  Future<void> deleteItemFromCart(String id) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loadingDelete));

    final result = await _deleteItemFromCartUseCase(id);
    log(result.toString());
    result.fold(
      (failure) => emit(
        state.copyWith(flowStateApp: FlowStateApp.notDeleted, failure: failure),
      ),
      (success) {
        getAllItemsFromCart();
      },
    );
  }

  Future<void> clearCart() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loadingDelete));
    final result = await _clearCartUseCase(unit);
    result.fold(
      (failure) => emit(
        state.copyWith(flowStateApp: FlowStateApp.notDeleted, failure: failure),
      ),
      (success) {
        getAllItemsFromCart();
      },
    );
  }

  Future<void> getAllItemsFromCart() async {
    log("getAllItemsFromCart");
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _getAllItemsFromCartUseCase(unit);
    result.fold(
      (failure) => emit(
        state.copyWith(flowStateApp: FlowStateApp.error, failure: failure),
      ),
      (data) => emit(
        state.copyWith(
          flowStateApp: FlowStateApp.normal,
          cartItems: data,
          countCart: data.items.length,
        ),
      ),
    );
  }

  Future<void> getCartCount() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _getCartCountsUseCase(unit);
    result.fold(
      (failure) => emit(
        state.copyWith(flowStateApp: FlowStateApp.error, failure: failure),
      ),
      (count) => emit(
        state.copyWith(flowStateApp: FlowStateApp.success, countCart: count),
      ),
    );
  }

  Future<Either<Failure, CartItem>> getItemFromCart(String id) async {
    return await _getItemFromCartUseCase(id);
  }

  Future<void> updateItemCart(CartItem item) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loadingUpdate));
    final result = await _updateItemCartUseCase(item);
    result.fold(
      (failure) => emit(
        state.copyWith(flowStateApp: FlowStateApp.notUpdated, failure: failure),
      ),
      (success) {
        getAllItemsFromCart();
      },
    );
  }
}
