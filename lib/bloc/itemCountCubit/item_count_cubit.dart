import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'item_count_state.dart';

class ItemCountCubit extends Cubit<ItemCountState> {
  int? itemCont = 1;

  ItemCountCubit({this.itemCont = 1}) : super(ItemCountInitial());
  static ItemCountCubit get(context) => BlocProvider.of(context);

  void increment() {
    itemCont = itemCont! + 1;
    emit(ItemCountIncremented());
  }
  void decrement() {
    if (itemCont! >= 2) {
      itemCont = itemCont! - 1;
      emit(ItemCountDecremented());
    }
  }
}
