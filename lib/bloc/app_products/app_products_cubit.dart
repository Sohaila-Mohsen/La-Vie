import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/product.dart';
import 'package:meta/meta.dart';

import '../../core/utils/sp_helper/cache_helper.dart';
import '../../model/plant.dart';
import '../../services/dio_helper.dart';

part 'app_products_state.dart';

class AppProductsCubit extends Cubit<AppProductsState> {
  AppProductsCubit() : super(AppProductsInitial());
  static AppProductsCubit get(context) => BlocProvider.of(context);

  List<Plant>? plants;
  PlantsResponse? plantsRespons;

  ProductsResponse? productResponse;
  List<Product?>? products;

  Future getPlants() async {
    print("getting plants start");
    await DioHelper.getData(
            url: "api/v1/plants/",
            token: SharedPreferencesHelper.getData(key: "accessToken"))
        .then((value) {
      emit(ProductLoadingState());
      //var jsondata = jsonDecode(token.data);

      plantsRespons = PlantsResponse.fromJson(value.data);
      print('plants data  : "${value.data}"');
      plants = plantsRespons!.data;
      print("api returns :$plants.length");
      emit(PlantsFetchedSuccessfuly());
    }).catchError((error) {
      print('error: ${error.toString()}');
      emit(ErrorPlantsFetching());
    });
  }

  Future getProducts() async {
    print("getting products start");
    await DioHelper.getData(
            url: "api/v1/products/",
            token: SharedPreferencesHelper.getData(key: "accessToken"))
        .then((value) {
      emit(ProductLoadingState());
      //var jsondata = jsonDecode(token.data);

      productResponse = ProductsResponse.fromJson(value.data);
      print('products data  : "${value.data}"');
      products = productResponse!.data;
      
      emit(PlantsFetchedSuccessfuly());
    }).catchError((error) {
      print('error: ${error.toString()}');
      emit(ErrorPlantsFetching());
    });
  }
}
