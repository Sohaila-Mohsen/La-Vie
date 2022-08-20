part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class GotUserSuccessfuly extends UserState {}
class UserLogedoutState extends UserState {}
class UserUpdated extends UserState {}
class LoadingState extends UserState {}
class ErrorState extends UserState {}
