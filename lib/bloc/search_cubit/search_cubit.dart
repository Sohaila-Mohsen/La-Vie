import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/utils/sp_helper/cache_helper.dart';
import '../../model/product.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  static List<Product>? searchResult;
  static List<Product>? baseList;
  bool clickedSearch = false;

  void getResult(String query) {
    print("query $query");
    print("base ${baseList!.length}");
    searchResult = baseList!.where((element) {
      print("object : ${element.name}");
      if (element.name!.toLowerCase().contains(query.toLowerCase()))
        return true;
      return false;
      ;
    }).toList();
    print("search res: ${searchResult!.length}");
    emit(SearchDoneState());
  }

  static void clearSearch() {
    if (searchResult != null) searchResult!.clear();
  }

  changeClick() {
    clickedSearch = !clickedSearch;
    emit(SearchClickChanged());
  }

  static List<String>? getUserHistory() {
    List<String> history = [];
    //bool hasData = false;
    String? token = SharedPreferencesHelper.getData(key: "accessToken");
    if (SharedPreferencesHelper.getData(key: "search1$token") != null) {
      //hasData = true;
      history.add(SharedPreferencesHelper.getData(key: "search1$token"));
    }
    if (SharedPreferencesHelper.getData(key: "search2$token") != null) {
      //hasData = true;
      history.add(SharedPreferencesHelper.getData(key: "search2$token"));
    }
    if (SharedPreferencesHelper.getData(key: "search3$token") != null) {
      //hasData = true;
      history.add(SharedPreferencesHelper.getData(key: "search3$token"));
    }
    return history;
  }

  static void saveToHistory(String query) {
    String? token = SharedPreferencesHelper.getData(key: "accessToken");
    if (SharedPreferencesHelper.getData(key: "search1$token") == null) {
      SharedPreferencesHelper.saveData(key: "search1$token", value: query);
    } else if (SharedPreferencesHelper.getData(key: "search2$token") == null) {
      SharedPreferencesHelper.saveData(key: "search2$token", value: query);
    } else if (SharedPreferencesHelper.getData(key: "search3$token") == null) {
      SharedPreferencesHelper.saveData(key: "search3$token", value: query);
    }
    // remove first search history then swap the rest to add new history query
    else {
      SharedPreferencesHelper.saveData(
          key: "search1$token",
          value: SharedPreferencesHelper.getData(key: "search2$token"));
      SharedPreferencesHelper.saveData(
          key: "search2$token",
          value: SharedPreferencesHelper.getData(key: "search3$token"));
      SharedPreferencesHelper.saveData(key: "search3$token", value: query);
    }
  }

  static void removeHistory() {
    String? token = SharedPreferencesHelper.getData(key: "accessToken");
    SharedPreferencesHelper.removeData(key: "search1$token");
    SharedPreferencesHelper.removeData(key: "search2$token");
    SharedPreferencesHelper.removeData(key: "search3$token");
  }
}
