/// An interface of persistence stores for the player's high scores.
///
/// Implementations can range from simple in-memory storage through
/// local preferences to cloud saves.
abstract class HighScoresPersistence {
  Future<List<int>> getHighScores();

  Future<void> saveHighScore(int level, int time);

  Future<void> reset();
}
