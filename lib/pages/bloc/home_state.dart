part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Welcome> welcomeList;

  HomeLoadedState(this.welcomeList);
  @override
  List<Object> get props => [welcomeList];
}

class HomeSearchLoadedState extends HomeState {
  final Welcome welcome;

  HomeSearchLoadedState(this.welcome);
  @override
  List<Object> get props => [welcome];
}

class NotFoundState extends HomeState {}
