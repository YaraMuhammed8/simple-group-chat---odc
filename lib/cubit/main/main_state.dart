part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}
class SendMessageSuccessfulState extends MainState {}
class SendMessageErrorState extends MainState {}
class GetMessagesSuccessfulState extends MainState {}
class GetMessagesErrorState extends MainState {}