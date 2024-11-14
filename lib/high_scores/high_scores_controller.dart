import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'persistence/local_storage_high_scores_persistence.dart';
import 'persistence/high_scores_persistence.dart';

part 'high_scores_controller.g.dart';

/// Encapsulates the player's high scores.
@riverpod
class HighScoresController extends _$HighScoresController {
  static final _log = Logger('HighScoresController');

  /// The persistence store that is used to save high scores.
  final HighScoresPersistence _store;

  /// Creates a new instance of [HighScoresPersistence] backed by [store].
  ///
  /// By default, settings are persisted using [LocalStorageHighScoresPersistence]
  /// (i.e. NSUserDefaults on iOS, SharedPreferences on Android or
  /// local storage on the web).
  HighScoresController({HighScoresPersistence? store})
      : _store = store ?? LocalStorageHighScoresPersistence();

  @override
  Future<List<int>> build() async {
    final scores = await _store.getHighScores();
    _log.fine(() => 'Loaded high scores: $scores');
    return scores;
  }

  void resetScores() async {
    _store.reset();
    ref.invalidateSelf();
  }

  void saveHighScore(int level, int time) async {
    await _store.saveHighScore(level, time);
    ref.invalidateSelf();
  }
}
