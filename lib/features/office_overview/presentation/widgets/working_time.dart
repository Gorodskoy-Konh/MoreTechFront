import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:more_tech_front/app_locale.dart';
import 'package:more_tech_front/features/office_overview/domain/models/working_hours/working_hours.dart';

class WorkingTime extends StatelessWidget {
  const WorkingTime({super.key, required this.workingHours});

  final List<WorkingHours> workingHours;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (WorkingHours hours in workingHours) {
      String strHours;
      if (hours.begin == null) {
        strHours = '${hours.day}: ${context.locale.weekend}';
      } else {
        strHours =
            '${hours.day}: ${DateFormat('hh:mm').format(hours.begin!)}-${DateFormat('hh:mm').format(hours.end!)}';
      }

      children.add(
        Container(
          margin: const EdgeInsets.only(left: 10, top: 3, bottom: 3, right: 10),
          child: Row(
            children: [
              const Icon(Icons.access_time_filled),
              Text(
                strHours,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: children,
    );
  }
}
