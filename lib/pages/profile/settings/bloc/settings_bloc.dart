import 'package:bloc_app/pages/application/bloc/application_event.dart';
import 'package:bloc_app/pages/profile/settings/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<AppEvents, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(SettingsState());
    });
  }
}