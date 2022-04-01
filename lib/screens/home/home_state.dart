import 'package:avengers_project/api/network_state/network_state.dart';
import 'package:avengers_project/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState(
      {@Default(
        NetworkState<UserModel>.loading(),
      )
          NetworkState<UserModel>? data}) = _HomeState;
}
