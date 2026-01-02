import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';
import 'package:pray_app/app/domain/entities/calendar_day_entity.dart';
import 'package:pray_app/app/modules/main/today/widgets/day_action.dart';

class QuickActions extends StatelessWidget {
  final List<CalendarDayEntity> calendar;

  const QuickActions({super.key, required this.calendar});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: calendar
              .map(
                (day) => DayAction(
                  label: day.day.substring(0, 1).toUpperCase(),
                  completed: day.completed,
                  highlighted: day.isToday,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward,
              size: 16,
              color: AppColors.primary,
            ),
            label: Text(
              'Ver minhas métricas',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                fontSize: 13,
              ),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      ],
    );
  }
}
