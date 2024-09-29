import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/strings/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_all_product.dart';
import '../../domain/usecases/get_single_products.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  GetAllProducts getAllProductsUseCase;
  GetSingleProducts getSingleProductsUseCase;

  ProductsCubit(
      {required this.getAllProductsUseCase,
      required this.getSingleProductsUseCase})
      : super(InitialAllProductsState());

  Future<void> fetchAllProducts() async {
    emit(LoadingAllProductsState());

    final failureOrDoneMessage = await getAllProductsUseCase();
    emit(_mapFailureOrPostsToStateAllProducts(failureOrDoneMessage));
  }

  ProductsState _mapFailureOrPostsToStateAllProducts(
      Either<Failure, List<ProductsEntity>> either) {
    return either.fold(
      (failure) =>
          ErrorAllProductsState(message: _mapFailureToMessage(failure)),
      (products) => GetAllProductsState(products),
    );
  }

  Future<void> fetchSingleProducts() async {
    emit(LoadingSingleProductsState());

    final failureOrDoneMessage = await getSingleProductsUseCase();
    emit(_mapFailureOrPostsToStateSingleProducts(failureOrDoneMessage));
  }

  ProductsState _mapFailureOrPostsToStateSingleProducts(
      Either<Failure, ProductsEntity?> either) {
    return either.fold(
        (failure) =>
            ErrorSingleProductsState(message: _mapFailureToMessage(failure)),
        (products) {
      if (products != null) {
        return GetSingleProductsState(products);
      } else {
        return ErrorSingleProductsState(message: FailureMessages.empty);
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return FailureMessages.error;
      case const (EmptyCacheFailure):
        return FailureMessages.noData;
      case const (OfflineFailure):
        return FailureMessages.noInternet;
      default:
        return FailureMessages.unexpected;
    }
  }
}
