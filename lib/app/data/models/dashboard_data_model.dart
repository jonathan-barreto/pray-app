import 'dart:convert';

import 'package:pray_app/app/data/models/calendar_day_model.dart';
import 'package:pray_app/app/data/models/devotional_model.dart';
import 'package:pray_app/app/data/models/passage_model.dart';

class DashboardDataModel {
  final DevotionalModel? publicDevotional;
  final PassageModel? passage;
  final List<CalendarDayModel> calendar;

  const DashboardDataModel({
    this.publicDevotional,
    this.passage,
    required this.calendar,
  });

  factory DashboardDataModel.fromJson(String source) {
    return DashboardDataModel.fromMap(jsonDecode(source));
  }

  factory DashboardDataModel.fromMap(Map<String, dynamic> map) {
    return DashboardDataModel(
      publicDevotional: map['public_devotional'] != null
          ? DevotionalModel.fromMap(map['public_devotional'])
          : null,
      passage: map['passage'] != null
          ? PassageModel.fromMap(map['passage'])
          : null,
      calendar: List<CalendarDayModel>.from(
        (map['calendar'] as List).map((x) => CalendarDayModel.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'public_devotional': publicDevotional?.toMap(),
      'passage': passage?.toMap(),
      'calendar': calendar.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => jsonEncode(toMap());
}
