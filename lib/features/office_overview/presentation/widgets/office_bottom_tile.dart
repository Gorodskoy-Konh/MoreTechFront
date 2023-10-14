import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_tech_front/app_locale.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/product_choose/product_choose_cubit.dart';
import 'package:more_tech_front/features/office_overview/presentation/widgets/working_time.dart';

class OfficeBottomTile extends StatefulWidget {
  const OfficeBottomTile(
      {super.key, required this.office, required this.scrollController});

  final Office? office;
  final ScrollController scrollController;

  @override
  State<OfficeBottomTile> createState() => _OfficeBottomTileState();
}

class _OfficeBottomTileState extends State<OfficeBottomTile> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    final productChooseState = context.watch<ProductChooseCubit>().state;
    if (widget.office != null) {
      children = [
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Icon(
                Icons.location_on,
                color: Color.fromRGBO(127, 127, 127, 1),
              ),
              Expanded(
                child: Text(
                  widget.office!.address,
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
            widget.office!.name,
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
          workingHours: widget.office!.workingHours,
        ),
      ];
    } else {
      switch (productChooseState){
        case ProductChooseInitial state:
          context.read<ProductChooseCubit>().getAllProducts();
          //TODO: loading or something for request to all products....
          break;
        case ProductChooseGettingAllProducts state:
          children = [
            const Center(
              child: CircularProgressIndicator(),
            ),
          ];
          break;
        case ProductChooseAllProducts state:
          children = [
            //TODO: dropdown
          ];
          break;
      }
    }
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          controller: widget.scrollController,
          children: children,
        ),
      ),
    );
  }
}
