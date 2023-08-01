import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({this.product}) : super(CartInitial());
  DocumentSnapshot? product;
  List selectedProducts = [];
  double price = 0;

  addProduct(DocumentSnapshot product) {
    selectedProducts.add(product);
    price += product['price'];
    emit(AddToCart());
  }

  removeProduct(DocumentSnapshot product) {
    try {
      selectedProducts.remove(product);
      price -= product['price'];
      if (price < 0) {
        price = 0;
      }
      emit(RemoveFromCart());
    } catch (e) {
      print(e);
    }
  }

  reset() {
    selectedProducts.clear();
    price = 0;
    emit(ResetCart());
  }
}
