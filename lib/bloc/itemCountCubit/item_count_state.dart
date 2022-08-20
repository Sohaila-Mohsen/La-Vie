part of 'item_count_cubit.dart';

@immutable
abstract class ItemCountState {}

class ItemCountInitial extends ItemCountState {}
class ItemCountIncremented extends ItemCountState {}
class ItemCountDecremented extends ItemCountState {}
