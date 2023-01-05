import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tut/fetching_data_demo/model/fetching_model.dart';
import 'package:flutter_riverpod_tut/fetching_data_demo/service/fetching_service_demo.dart';

abstract class UserState {}

class InitialState extends UserState {}

class LoadingState extends UserState {}

class LoadedState extends UserState {
  final List<UserModel> usersList;

  LoadedState(this.usersList);
}

class ErrorState extends UserState {
  final String message;

  ErrorState(this.message);
}

final fetchProvider = StateNotifierProvider<FetchNotifier, UserState>(
  (ref) => FetchNotifier(),
);

class FetchNotifier extends StateNotifier<UserState> {
  FetchNotifier() : super(InitialState());
  final HttpFetching _httpFetching = HttpFetching();

  onFetch() async {
    try {
      state = LoadingState();
      List<UserModel> usersLists = await _httpFetching.fetchData();
      state = LoadedState(usersLists);
    } catch (e) {
      state = ErrorState(e.toString());
    }
  }
}
