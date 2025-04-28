part of 'home_cubit.dart';

class HomeState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final Products products;
  const HomeState({
    this.flowStateApp = FlowStateApp.normal,
    this.failure = const Failure(),
    this.products = const Products(),
  });

  HomeState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    Products? products,
  }) {
    return HomeState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [flowStateApp, failure, products];
}
