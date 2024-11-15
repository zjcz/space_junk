import 'package:shared_preferences/shared_preferences.dart';

import 'high_scores_persistence.dart';

/// An implementation of [HighScoresPersistence] that uses
/// `package:shared_preferences`.
class LocalStorageHighScoresPersistence extends HighScoresPersistence {
  final Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();

  @override
  Future<List<int>> getHighScores() async {
    final prefs = await instanceFuture;
    final serialized = prefs.getStringList('levelsFinished') ?? [];

    return serialized.map(int.parse).toList();
  }

  @override
  Future<void> saveHighScore(int level, int time) async {
    final prefs = await instanceFuture;
    final serialized = prefs.getStringList('levelsFinished') ?? [];
    if (level <= serialized.length) {
      final currentTime = int.parse(serialized[level - 1]);
      if (time < currentTime) {
        serialized[level - 1] = time.toString();
      }
    } else {
      serialized.add(time.toString());
    }
    await prefs.setStringList('levelsFinished', serialized);
  }

  @override
  Future<void> reset() async {
    final prefs = await instanceFuture;
    await prefs.remove('levelsFinished');
  }
}
