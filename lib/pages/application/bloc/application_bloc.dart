import 'package:bloc_app/pages/application/bloc/application_event.dart';
import 'package:bloc_app/pages/application/bloc/application_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvents, AppState>{
  AppBloc(): super(AppState()){
    on<TriggerAppEvent>((event, emit) {
      print("index: ${event.index}");
      emit(AppState(index: event.index));
    });
  }

}