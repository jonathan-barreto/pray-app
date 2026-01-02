import 'dart:convert';

class UserMetricsModel {
  final int streakDays;
  final int streakMonths;
  final int streakYears;
  final int longestStreak;
  final int devotionalsCompleted;
  final int passagesCompleted;
  final int? rankPosition;
  final String createdAt;
  final String updatedAt;

  const UserMetricsModel({
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

  factory UserMetricsModel.fromJson(String source) {
    return UserMetricsModel.fromMap(jsonDecode(source));
  }

  factory UserMetricsModel.fromMap(Map<String, dynamic> map) {
    return UserMetricsModel(
      streakDays: map['streak_days'] ?? 0,
      streakMonths: map['streak_months'] ?? 0,
      streakYears: map['streak_years'] ?? 0,
      longestStreak: map['longest_streak'] ?? 0,
      devotionalsCompleted: map['devotionals_completed'] ?? 0,
      passagesCompleted: map['passages_completed'] ?? 0,
      rankPosition: map['rank_position'],
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'streak_days': streakDays,
      'streak_months': streakMonths,
      'streak_years': streakYears,
      'longest_streak': longestStreak,
      'devotionals_completed': devotionalsCompleted,
      'passages_completed': passagesCompleted,
      'rank_position': rankPosition,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  String toJson() => jsonEncode(toMap());
}
