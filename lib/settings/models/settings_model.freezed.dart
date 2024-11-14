// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsModel {
  bool get audioOn => throw _privateConstructorUsedError;
  bool get musicOn => throw _privateConstructorUsedError;
  bool get soundsOn => throw _privateConstructorUsedError;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call({bool audioOn, bool musicOn, bool soundsOn});
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioOn = null,
    Object? musicOn = null,
    Object? soundsOn = null,
  }) {
    return _then(_value.copyWith(
      audioOn: null == audioOn
          ? _value.audioOn
          : audioOn // ignore: cast_nullable_to_non_nullable
              as bool,
      musicOn: null == musicOn
          ? _value.musicOn
          : musicOn // ignore: cast_nullable_to_non_nullable
              as bool,
      soundsOn: null == soundsOn
          ? _value.soundsOn
          : soundsOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsModelImplCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$SettingsModelImplCopyWith(
          _$SettingsModelImpl value, $Res Function(_$SettingsModelImpl) then) =
      __$$SettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool audioOn, bool musicOn, bool soundsOn});
}

/// @nodoc
class __$$SettingsModelImplCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$SettingsModelImpl>
    implements _$$SettingsModelImplCopyWith<$Res> {
  __$$SettingsModelImplCopyWithImpl(
      _$SettingsModelImpl _value, $Res Function(_$SettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioOn = null,
    Object? musicOn = null,
    Object? soundsOn = null,
  }) {
    return _then(_$SettingsModelImpl(
      audioOn: null == audioOn
          ? _value.audioOn
          : audioOn // ignore: cast_nullable_to_non_nullable
              as bool,
      musicOn: null == musicOn
          ? _value.musicOn
          : musicOn // ignore: cast_nullable_to_non_nullable
              as bool,
      soundsOn: null == soundsOn
          ? _value.soundsOn
          : soundsOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingsModelImpl
    with DiagnosticableTreeMixin
    implements _SettingsModel {
  const _$SettingsModelImpl(
      {required this.audioOn, required this.musicOn, required this.soundsOn});

  @override
  final bool audioOn;
  @override
  final bool musicOn;
  @override
  final bool soundsOn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsModel(audioOn: $audioOn, musicOn: $musicOn, soundsOn: $soundsOn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsModel'))
      ..add(DiagnosticsProperty('audioOn', audioOn))
      ..add(DiagnosticsProperty('musicOn', musicOn))
      ..add(DiagnosticsProperty('soundsOn', soundsOn));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsModelImpl &&
            (identical(other.audioOn, audioOn) || other.audioOn == audioOn) &&
            (identical(other.musicOn, musicOn) || other.musicOn == musicOn) &&
            (identical(other.soundsOn, soundsOn) ||
                other.soundsOn == soundsOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioOn, musicOn, soundsOn);

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      __$$SettingsModelImplCopyWithImpl<_$SettingsModelImpl>(this, _$identity);
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel(
      {required final bool audioOn,
      required final bool musicOn,
      required final bool soundsOn}) = _$SettingsModelImpl;

  @override
  bool get audioOn;
  @override
  bool get musicOn;
  @override
  bool get soundsOn;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
