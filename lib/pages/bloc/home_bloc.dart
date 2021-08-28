import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo/models/gst-info.dart';
import 'package:demo/services/api_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  List<Welcome> welcomeList;
  final ApiManager apiManager = ApiManager();

  @override
  void onEvent(HomeEvent event) {
    // print(event);
    super.onEvent(event);
  }

  @override
  void onChange(Change<HomeState> change) {
    print(change);
    super.onChange(change);
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadHomeEvent) {
      welcomeList = await apiManager.getNews();
      yield HomeLoadedState(welcomeList);
    } else if (event is SearchWelcomeEvent) {
      Welcome welcome;
      for (Welcome each in welcomeList) {
        if (each.GSTINNumber.contains(event.id)) {
          welcome = each;
          break;
        }
      }

      if (welcome == null)
        yield NotFoundState();
      else
        yield HomeSearchLoadedState(welcome);
    }
  }
}
