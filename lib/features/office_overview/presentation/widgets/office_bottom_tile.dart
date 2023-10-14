import 'package:flutter/material.dart';
import 'package:more_tech_front/app_locale.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';
import 'package:more_tech_front/features/office_overview/presentation/widgets/working_time.dart';

class OfficeBottomTile extends StatefulWidget {
  const OfficeBottomTile(
      {super.key, required this.office, required this.scrollController});

  final Office office;
  final ScrollController scrollController;

  @override
  State<OfficeBottomTile> createState() => _OfficeBottomTileState();
}

class _OfficeBottomTileState extends State<OfficeBottomTile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          controller: widget.scrollController,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(127, 127, 127, 1),
                  ),
                  Expanded(
                    child: Text(
                      widget.office.address,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(127, 127, 127, 1),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              decoration: const BoxDecoration(),
              child: Text(
                widget.office.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //TODO: show route on the map to this branch
              },
              child: Text(
                context.locale.showRoute,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            WorkingTime(
              workingHours: widget.office.workingHours,
            ),
            // Container(
            //
            //   child: Row(
            //     children: [
            //       const Icon(Icons.access_time_filled),
            //       Text(
            //         widget.office.workingHours,
            //         style: TextStyle(
            //           fontSize: 18,
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
