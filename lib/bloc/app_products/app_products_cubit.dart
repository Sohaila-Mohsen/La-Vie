import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/product.dart';
import 'package:la_vie/model/seeds.dart';
import 'package:la_vie/model/tools.dart';
import '../../core/utils/sp_helper/cache_helper.dart';
import '../../model/plant.dart';
import '../../services/dio_helper.dart';

part 'app_products_state.dart';

class AppProductsCubit extends Cubit<AppProductsState> {
  AppProductsCubit() : super(AppProductsInitial());
  static AppProductsCubit get(context) => BlocProvider.of(context);

  ProductsResponse? productResponse;
  List<Product?>? products;
  int selectedCategory = 0; //0=>all 1=>plants 2=>seeds 3=>tools

  Product? p;

  Future getPlants() async {
    if (selectedCategory != 1) {
      products = null;
      selectedCategory = 1;
      emit(ProductsCleared());
      await DioHelper.getData(
              url: "api/v1/plants/",
              token: SharedPreferencesHelper.getData(key: "accessToken"))
          .then((value) {
        emit(PlantLoadingState());
        //var jsondata = jsonDecode(token.data);
        PlantsResponse plantsRespons = PlantsResponse.fromJson(value.data);
        productResponse = ProductsResponse(
            type: plantsRespons.type,
            message: plantsRespons.message,
            data: Product.plantToProduct(plantsRespons.data!));
        products = productResponse!.data;
        emit(PlantsFetchedSuccessfully());
      }).catchError((error) {
        print('error: ${error.toString()}');
        emit(ErrorPlantsFetching());
      });
    }
  }

  Future getSeeds() async {
    if (selectedCategory != 2) {
      selectedCategory = 2;
      products = null;
      emit(ProductsCleared());
      await DioHelper.getData(
              url: "api/v1/seeds/",
              token: SharedPreferencesHelper.getData(key: "accessToken"))
          .then((value) {
        emit(SeedsLoadingState());
        SeedsResponse seedsResponse = SeedsResponse.fromJson(value.data);
        productResponse = ProductsResponse(
            type: seedsResponse.type,
            message: seedsResponse.message,
            data: Product.seedToProduct(seedsResponse.data!));
        products = productResponse!.data;
        emit(SeedsFetchedSuccessfully());
      }).catchError((error) {
        print('error: ${error.toString()}');
        emit(ErrorSeedsFetching());
      });
    }
  }

  Future getTools() async {
    if (selectedCategory != 3) {
      selectedCategory = 3;
      products = null;
      emit(ProductsCleared());
      await DioHelper.getData(
              url: "api/v1/tools/",
              token: SharedPreferencesHelper.getData(key: "accessToken"))
          .then((value) {
        emit(ToolsLoadingState());
        //var jsondata = jsonDecode(token.data);
        ToolsResponse toolsResponse = ToolsResponse.fromJson(value.data);
        productResponse = ProductsResponse(
            type: toolsResponse.type,
            message: toolsResponse.message,
            data: Product.toolToProduct(toolsResponse.data!));
        products = productResponse!.data;
        emit(ToolsFetchedSuccessfully());
      }).catchError((error) {
        print('error: ${error.toString()}');
        emit(ErrorToolsFetching());
      });
    }
  }

  void updatePlantPlus(int index) {
    products![index]!.quantity = products![index]!.quantity + 1;
    emit(ProductCountIncrementedState());
  }

  void updatePlantMinus(int index) {
    if (products![index]!.quantity > 1) {
      products![index]!.quantity = products![index]!.quantity - 1;
      emit(ProductCountDecrementedState());
    }
  }

  Future getProducts() async {
    selectedCategory = 0;
    products = null;
    emit(ProductsCleared());
    await DioHelper.getData(
            url: "api/v1/products/",
            token: SharedPreferencesHelper.getData(key: "accessToken"))
        .then((value) {
      emit(ProductLoadingState());
      //var jsondata = jsonDecode(token.data);

      productResponse = ProductsResponse.fromJson(value.data);
      products = productResponse!.data;

      emit(PlantsFetchedSuccessfully());
    }).catchError((error) {
      print('error: ${error.toString()}');
      emit(ErrorPlantsFetching());
    });
  }

  Future<void> getSingleProduct(String productId) async {
    print("product is from app pro : $productId");
    await DioHelper.getData(
            url: "api/v1/products/$productId/",
            //query: {"productId": productId},
            token: SharedPreferencesHelper.getData(key: "accessToken"))
        .then((value) {
      //var jsondata = jsonDecode(token.data);
      print("vallllllll: $value");
      ProductsResponse productsResponse =
          ProductsResponse.fromJsonSingle(value.data);
       p =  productsResponse.singleProduct!;
      //return Product(name: p.name, available: p.available);
      /* print("product id : ${product.name}");
      return product; */
    }).catchError((error) {
      print('error: ${error.toString()}');
    });
  }
}
