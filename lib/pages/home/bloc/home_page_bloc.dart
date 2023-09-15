import 'package:bloc_app/pages/home/bloc/home_page_events.dart';
import 'package:bloc_app/pages/home/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<HomePageDots>(_homePageDots);
  }
  void _homePageDots(HomePageDots evet, Emitter<HomePageState> emit){
    emit(state.copyWith(evet.index));
  }
}