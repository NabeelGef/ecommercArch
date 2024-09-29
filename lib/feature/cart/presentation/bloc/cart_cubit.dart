import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/strings/failures.dart';
import '../../../../core/strings/messages.dart';
import '../../domain/entities/add_to_cart_entitity.dart';
import '../../domain/entities/cart_entitites.dart';
import '../../domain/usecases/AddToCart.dart';
import '../../domain/usecases/GetAllCarts.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState>{

  GetAllCartsUseCase getAllCartsUseCase;
  AddToCartUseCase addToCartUseCase;
  CartCubit({required this.getAllCartsUseCase ,
    required this.addToCartUseCase}):super(InitialCartState());
  addToCart(AddToCartEntity addToCartEntity) async {
    emit(LoadingAddToCartState());

    final failureOrDoneMessage = await getAllCartsUseCase();
    emit(_mapFailureOrPostsToStateAddToCart(failureOrDoneMessage));

  }
  fetchAllCarts() async {
    emit(LoadingCartState());

    final failureOrDoneMessage = await getAllCartsUseCase();
    emit(_mapFailureOrPostsToStateCarts(failureOrDoneMessage));
  }

  CartState _mapFailureOrPostsToStateCarts(
      Either<Failure, List<CartEntity>> either) {
    return either.fold(
          (failure) => ErrorCartState(message: _mapFailureToMessage(failure)),
          (cart) => GetCartState(cart),
    );
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
  CartState _mapFailureOrPostsToStateAddToCart(
      Either<Failure, List<CartEntity>> either) {
    return either.fold(
          (failure) => ErrorAddToCartState(message: _mapFailureToMessage(failure)),
          (_) => AddToCartSuccessState(successMessage: AppMessages.addToCartSuccess),
    );
  }
}

