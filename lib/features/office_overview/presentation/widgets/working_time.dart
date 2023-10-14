import 'package:flutter/material.dart';
import 'package:more_tech_front/app_locale.dart';
import 'package:more_tech_front/features/office_overview/domain/models/working_hours/working_hours.dart';

class WorkingTime extends StatelessWidget {
  const WorkingTime({super.key, required this.workingHours});

  final List<WorkingHours> workingHours;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (WorkingHours hours in workingHours){
      String strHours = '${hours.day}: ${hours.begin}-${hours.end}';
      if (hours.begin.isEmpty){
        strHours = hours.day + ': ' + context.locale.weekend;
      }
      children.add(
        Container(
          margin: EdgeInsets.only(left: 10, top: 3, bottom: 3, right: 10),
          child: Row(
            children: [
              const Icon(Icons.access_time_filled),
              Text(
                strHours,
                style: TextStyle(
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
