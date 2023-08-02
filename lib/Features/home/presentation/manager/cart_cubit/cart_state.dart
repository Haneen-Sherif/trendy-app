part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class AddToCart extends CartState {}

class RemoveFromCart extends CartState {}

class ResetCart extends CartState {}
