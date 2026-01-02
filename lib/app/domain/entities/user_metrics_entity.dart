class UserMetricsEntity {
  final int streakDays;
  final int streakMonths;
  final int streakYears;
  final int longestStreak;
  final int devotionalsCompleted;
  final int passagesCompleted;
  final int? rankPosition;
  final String createdAt;
  final String updatedAt;

  const UserMetricsEntity({
    required this.streakDays,
    required this.streakMonths,
    required this.streakYears,
    required this.longestStreak,
    required this.devotionalsCompleted,
    required this.passagesCompleted,
    this.rankPosition,
    required this.createdAt,
    required this.updatedAt,
  });
}
