import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class InitialAllProductsState extends ProductsState {}

final class GetAllProductsState extends ProductsState {
  List<ProductsEntity> products;
  GetAllProductsState(this.products);
  @override
  List<Object> get props => [products];
}

final class LoadingAllProductsState extends ProductsState {}

final class ErrorAllProductsState extends ProductsState {
  String message;

  ErrorAllProductsState({required this.message});

  @override
  List<Object> get props => [message];
}

final class InitialSingleProductsState extends ProductsState {}

final class GetSingleProductsState extends ProductsState {
  ProductsEntity products;
  GetSingleProductsState(this.products);
  @override
  List<Object> get props => [products];
}

final class LoadingSingleProductsState extends ProductsState {}

final class ErrorSingleProductsState extends ProductsState {
  String message;

  ErrorSingleProductsState({required this.message});

  @override
  List<Object> get props => [message];
}
