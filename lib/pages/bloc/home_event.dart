part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadHomeEvent extends HomeEvent {}

class SearchWelcomeEvent extends HomeEvent {
  final String id;

  SearchWelcomeEvent(this.id);
}
