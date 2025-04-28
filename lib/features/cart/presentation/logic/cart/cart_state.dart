part of 'cart_cubit.dart';

class CartState extends Equatable {
  final FlowStateApp flowStateApp;
  final CartData cartItems;
  final Failure failure;
  final int countCart;

  const CartState({
    this.cartItems = const CartData(),
    this.flowStateApp = FlowStateApp.draft,
    this.failure = const Failure(),
    this.countCart = 0,
  });

  copyWith({
    FlowStateApp? flowStateApp,
    CartData? cartItems,
    Failure? failure,
    int? countCart,
  }) => CartState(
    flowStateApp: flowStateApp ?? this.flowStateApp,
    cartItems: cartItems ?? this.cartItems,
    failure: failure ?? this.failure,
    countCart: countCart ?? this.countCart,
  );

  double get totalPrice {
    return cartItems.items.fold(
      0.0,
      (previousValue, element) =>
          previousValue.toDouble() +
          element.price.toDouble() * element.quantity,
    );
  }

  @override
  List<Object> get props => [cartItems, flowStateApp, failure, countCart];
}
