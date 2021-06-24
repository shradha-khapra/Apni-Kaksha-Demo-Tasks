import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/data/models/product.dart';

abstract class BlocEvent {}

abstract class BlocState {}

class AddToCart extends BlocEvent {
  Product? prd;
  AddToCart({this.prd});
}

class DelCart extends BlocEvent {
  Product? prd;
  DelCart({this.prd});
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

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    yield LoadingState();
    try {
      if (event is AddToCart) {
        cartProducts.add(event.prd!);
      }
      if (event is DelCart) {
        cartProducts.remove(event.prd!);
      }
      yield SuccessState(count: cartProducts.length);
    } catch (e) {
      yield FailState(fail: e);
    }
  }
}
