import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/data/models/product.dart';

abstract class BlocEvent {}

abstract class BlocState {}

class AddToCart extends BlocEvent {
  Product? product;
  AddToCart({this.product});
}

class DeleteFromCart extends BlocEvent {
  Product? product;
  DeleteFromCart({this.product});
}

class RemoveItemFromCart extends BlocEvent {
  Product? product;
  RemoveItemFromCart({this.product});
}

class LoadingState extends BlocState {}

class SuccessState extends BlocState {
  int? count;
  SuccessState({this.count});
}

class FailState extends BlocState {
  Object? fail;
  FailState({this.fail});
}

class ProductBloc extends Bloc<BlocEvent, BlocState> {
  ProductBloc() : super(SuccessState(count: 0));

  List<Product> cartProducts = [];
  int totalCartCost = 0;
  int totalItems = 0;
  Map<int, int> quantityOfEachId = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    yield LoadingState();
    try {
      if (event is AddToCart) {
        totalItems += 1;
        Product currentProduct = event.product!;
        int id = currentProduct.productId!;
        totalCartCost += currentProduct.productPrice!;

        if (quantityOfEachId[id]! == 0) {
          cartProducts.add(currentProduct);
        }
        quantityOfEachId[id] = quantityOfEachId[id]! + 1;
      }
      if (event is DeleteFromCart) {
        totalItems -= 1;
        Product currentProduct = event.product!;
        int id = currentProduct.productId!;
        totalCartCost -= event.product!.productPrice!;

        if (quantityOfEachId[id]! == 1) {
          cartProducts.remove(currentProduct);
        }
        quantityOfEachId[id] = quantityOfEachId[id]! - 1;
      }

      if (event is RemoveItemFromCart) {
        Product currentProduct = event.product!;
        int id = currentProduct.productId!;

        int currentQuantityInCart = quantityOfEachId[id]!;
        int totalCostOfItem =
            currentQuantityInCart * currentProduct.productPrice!;

        totalCartCost = totalCartCost - totalCostOfItem;
        totalItems -= currentQuantityInCart;
        quantityOfEachId[id] = 0;
        cartProducts.remove(currentProduct);
      }

      yield SuccessState(count: totalItems);
    } catch (e) {
      yield FailState(fail: e);
    }
  }
}
