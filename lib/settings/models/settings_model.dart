import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'settings_model.freezed.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    required bool audioOn,
    required bool musicOn,
    required bool soundsOn,
  }) = _SettingsModel;
}