import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/api/api.dart';
import '../Repository/modelclass/translate.dart';

part 'translate_event.dart';
part 'translate_state.dart';

class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  late Translate animeModel;
  MovieApi animeApi=MovieApi();
  TranslateBloc() : super(TranslateInitial()) {
    on<TranslateEvent>((event, emit) async {
      emit(TranslateLoading());
      try{

        animeModel = await animeApi.getMovie();
        emit(TranslateLoaded());
      } catch(e){
        print(e);
        emit(TranslateError());}
    });
  }
}
