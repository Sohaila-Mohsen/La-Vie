part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchDoneState extends SearchState {}
class SearchClickChanged extends SearchState {}
