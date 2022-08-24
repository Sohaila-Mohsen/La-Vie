part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class ProductRemoved extends CartState {}
class ProductAdded extends CartState {}
class LoadingState extends CartState {}
class ErrorState extends CartState {}
class SuccessState extends CartState {}
class QuantityUpdated extends CartState {}
