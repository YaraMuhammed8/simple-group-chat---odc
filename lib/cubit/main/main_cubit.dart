import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/message.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  void sendMessage(Map<String, dynamic> message) {
    FirebaseFirestore.instance.collection('chat').add(message).then((value){
      emit(SendMessageSuccessfulState());
    }).catchError((error){
      emit(SendMessageErrorState());
    });
  }
List<Message>? messages;
  void getMessages(){

  }
}