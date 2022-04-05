import 'package:avengers_project/api/network_state/network_state.dart';
import 'package:avengers_project/api/services/api_services.dart';
import 'package:avengers_project/screens/home/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
    (_) => HomeStateNotifier());

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(const HomeState()) {
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    state = state.copyWith(data: const NetworkState.loading());

    final result = await ApiServices().getUserInfo();

    result.maybeMap((data) => state = state.copyWith(data: data),
        orElse: () {});
  }
}
