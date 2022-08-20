import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'selected_index_state.dart';

class SelectedIndexCubit extends Cubit<SelectedIndexState> {
  int? selectedIndex = 2;

  SelectedIndexCubit({this.selectedIndex = 2}) : super(SelectedIndexInitial());
  static SelectedIndexCubit get(context) => BlocProvider.of(context);

  void changeIndex(int selected) {
    selectedIndex = selected;
    emit(SelectedIndexInChanged());
  }
}
