part of 'app_products_cubit.dart';
abstract class AppProductsState {}

class AppProductsInitial extends AppProductsState {}
class ProductsCleared extends AppProductsState {}
class ProductLoadingState extends AppProductsState {}
class ProductCountIncrementedState extends AppProductsState {}
class ProductCountDecrementedState extends AppProductsState {}
class PlantLoadingState extends AppProductsState {}
class PlantsFetchedSuccessfully extends AppProductsState {}
class ErrorPlantsFetching extends AppProductsState {}
class SeedsLoadingState extends AppProductsState {}
class SeedsFetchedSuccessfully extends AppProductsState {}
class ErrorSeedsFetching extends AppProductsState {}
class ToolsLoadingState extends AppProductsState {}
class ToolsFetchedSuccessfully extends AppProductsState {}
class ErrorToolsFetching extends AppProductsState {}
