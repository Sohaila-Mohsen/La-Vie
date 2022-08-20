part of 'app_products_cubit.dart';

@immutable
abstract class AppProductsState {}

class AppProductsInitial extends AppProductsState {}

class ProductLoadingState extends AppProductsState {}
class PlantsFetchedSuccessfuly extends AppProductsState {}
class ErrorPlantsFetching extends AppProductsState {}