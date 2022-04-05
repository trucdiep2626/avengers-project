import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    @Default(false) bool isUserLoggedIn,
    String? userId,
    String? name,
    String? email,
    Uint8List? avatar,
    String? fcmToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
