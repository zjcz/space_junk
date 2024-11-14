import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle.g.dart';

@riverpod
class AppLifecycleObserver extends _$AppLifecycleObserver {
  static final _log = Logger('AppLifecycleObserver');
  AppLifecycleState _lifecycleState = AppLifecycleState.inactive;
  AppLifecycleListener? _appLifecycleListener;

  @override
  AppLifecycleState build() {
    return _lifecycleState;
  }

  void lifecycleChanged(AppLifecycleState state) {
    _log.info('Lifecycle changed to $state');
    _lifecycleState = state;
    ref.invalidateSelf();
  }

  void init() {
    // ignore: prefer_conditional_assignment
    if (_appLifecycleListener == null) {
      _appLifecycleListener =
          AppLifecycleListener(onStateChange: lifecycleChanged);

      // Defining this here causes it to be called every time build() is
      // called, which isn't what we want.
      // ref.onDispose(() {
      //   _appLifecycleListener?.dispose();
      //   _appLifecycleListener = null;
      // });
    }
  }

  /// Dispose of the objects
  void dispose() {
    _appLifecycleListener?.dispose();
    _appLifecycleListener = null;
  }
}
