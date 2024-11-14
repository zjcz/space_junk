import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:space_junk/settings/models/settings_model.dart';

import 'persistence/local_storage_settings_persistence.dart';
import 'persistence/settings_persistence.dart';

part 'settings_controller.g.dart';

/// An class that holds settings like [soundsOn] or [musicOn],
/// and saves them to an injected persistence store.
@riverpod
class SettingsController extends _$SettingsController {
  static final _log = Logger('SettingsController');

  /// The persistence store that is used to save settings.
  final SettingsPersistence _store;

  // SettingsModel _settings =
  //     const SettingsModel(audioOn: true, musicOn: true, soundsOn: true);

  /// Creates a new instance of [SettingsController] backed by [store].
  ///
  /// By default, settings are persisted using [LocalStorageSettingsPersistence]
  /// (i.e. NSUserDefaults on iOS, SharedPreferences on Android or
  /// local storage on the web).
  SettingsController({SettingsPersistence? store})
      : _store = store ?? LocalStorageSettingsPersistence();

  @override
  Future<SettingsModel> build() async {
    return _loadStateFromPersistence();
  }

  void toggleAudioOn() async {
    SettingsModel currentSettings = state.value!;
    SettingsModel newSettings =
        currentSettings.copyWith(audioOn: !currentSettings.audioOn);
    await _store.saveAudioOn(newSettings.audioOn);

    state = AsyncData(newSettings);
  }

  void toggleMusicOn() async {
    SettingsModel currentSettings = state.value!;
    SettingsModel newSettings =
        currentSettings.copyWith(musicOn: !currentSettings.musicOn);
    await _store.saveMusicOn(newSettings.musicOn);

    state = AsyncData(newSettings);
  }

  void toggleSoundsOn() async {
    SettingsModel currentSettings = state.value!;
    SettingsModel newSettings =
        currentSettings.copyWith(soundsOn: !currentSettings.soundsOn);
    await _store.saveSoundsOn(newSettings.soundsOn);

    state = AsyncData(newSettings);
  }

  /// Asynchronously loads values from the injected persistence store.
  Future<SettingsModel> _loadStateFromPersistence() async {
    bool audioOn = true;
    bool musicOn = true;
    bool soundsOn = true;

    final loadedValues = await Future.wait([
      _store.getAudioOn(defaultValue: true).then((value) {
        if (kIsWeb) {
          // On the web, sound can only start after user interaction, so
          // we start muted there on every game start.
          return audioOn = false;
        }
        // On other platforms, we can use the persisted value.
        return audioOn = value;
      }),
      _store.getSoundsOn(defaultValue: true).then((value) => soundsOn = value),
      _store.getMusicOn(defaultValue: true).then((value) => musicOn = value),
    ]);

    _log.fine(() => 'Loaded settings: $loadedValues');

    return SettingsModel(
      audioOn: audioOn,
      musicOn: musicOn,
      soundsOn: soundsOn,
    );
  }
}
