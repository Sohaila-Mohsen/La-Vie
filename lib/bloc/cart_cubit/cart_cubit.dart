import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/product.dart';
import 'package:la_vie/services/dio_helper.dart';
import 'package:la_vie/services/sql_helper.dart';
import 'package:meta/meta.dart';

import '../app_products/app_products_cubit.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  double total = 0.0;
  List<Product> myCart = [];

  void addProduct(Product product, {int quantity = 1}) {
    SQLHelper.createItem(product.productId.toString(), product.quantity);
    total = total + (product.price! * quantity);
    emit(ProductAdded());
  }

  void deleteProduct(index) {
    SQLHelper.deleteItem(myCart[index].productId!);
    total = total - (myCart[index].price! * myCart[index].quantity);
    myCart.removeAt(index);
    print("cart after delete ${myCart.length}");
    emit(ProductRemoved());
  }

  setTotal(double t) {
    total = t;
    emit(SuccessState());
  }

  void updateQuantityMinus(int index) {
    myCart[index].quantity = myCart[index].quantity - 1;
    SQLHelper.updateQuantity(myCart[index].productId!, myCart[index].quantity);
    emit(QuantityUpdated());
  }

  void updateQuantityPlus(int index) {
    myCart[index].quantity = myCart[index].quantity + 1;
    SQLHelper.updateQuantity(myCart[index].productId!, myCart[index].quantity);
    emit(QuantityUpdated());
  }

  Future<void> getProducts() async {
    List<Map<String, dynamic>> value = await SQLHelper.getItems();
    print("---------------------------$value");
    for (var product in value) {
      print("peooo 000000 : $product");
      String productId = product['productId'];
      print("id : $productId");
      AppProductsCubit appProductsCubit = AppProductsCubit();
      await appProductsCubit.getSingleProduct(productId).then((value) {
        print("Tttttttttttttttttttttt/${appProductsCubit.p!.name}");
        myCart.add(appProductsCubit.p!);
      });
      print("item added to cart successfully ${myCart.length}");
    }
    emit(SuccessState());
  }

  // TODO :: testing
  void buyProducts() {
    DioHelper.postData(
        url: "api/v1/products/buy/",
        data: {"products": SQLHelper.getItems()}).then((value) {
      emit(LoadingState());
      print('products data  : "${value.data}"');
      emit(SuccessState());
    }).catchError((e) {
      print("error in buying, Error : $e");
    });
  }
}
