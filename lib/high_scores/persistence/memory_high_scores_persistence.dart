import 'dart:core';

import 'high_scores_persistence.dart';

/// An in-memory implementation of [HighScoresPersistence].
/// Useful for testing.
class MemoryHighScoresPersistence implements HighScoresPersistence {
  final levels = <int>[];

  @override
  Future<List<int>> getHighScores() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return levels;
  }

  @override
  Future<void> saveHighScore(int level, int time) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (level < levels.length - 1 && levels[level - 1] > time) {
      levels[level - 1] = time;
    }
  }

  @override
  Future<void> reset() async {
    levels.clear();
  }
}
