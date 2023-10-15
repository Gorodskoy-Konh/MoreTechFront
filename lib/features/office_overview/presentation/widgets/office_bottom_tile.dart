import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_tech_front/app_locale.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/product_choose/product_choose_cubit.dart';
import 'package:more_tech_front/features/office_overview/presentation/widgets/working_time.dart';

import '../../domain/models/service/product.dart';

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
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          controller: widget.scrollController,
          children: children(),
        ),
      ),
    );
  }

  List<Widget> children() {
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
      switch (productChooseState) {
        case ProductChooseGettingAllProducts _:
          children = [
            const Center(
              child: CircularProgressIndicator(),
            ),
          ];
          break;
        case ProductChooseRecivedOffices state:
          children = [
            Center(
              child: ListTile(
                title: Text(context.locale.fastest),
                subtitle: Text('${state.estimatedTimeFastest / 60}'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                // TODO: route
              },
              child: Text(state.officeFastest.address),
            ),
            Center(
              child: ListTile(
                title: Text(context.locale.closest),
                subtitle: Text('${state.estimatedTimeClosest / 60}'),
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: route
              },
              child: Text(state.officeClosest.address),
            ),
          ];
          break;
        case ProductChooseAllProducts state:
          children = [
            //TODO: dropdown
            const SizedBox(
              height: 15,
            ),
            Center(child: Text(context.locale.chooseProduct)),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: DropdownButton<Product>(
                value: state.selectedProduct,
                items: state.products
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (product) {
                  if (product != null) {
                    context.read<ProductChooseCubit>().selectProduct(product);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Row(
                children: [
                  Text(context.locale.chooseTime),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      readOnly: true,
                      controller: _timeController,
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then(
                          (time) {
                            _timeController.text = time!.format(context);
                            context.read<ProductChooseCubit>().selectTime(time);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  context.locale.suggestOptimalOffice,
                ),
              ),
            ),
          ];
          break;
      }
    }
    return children;
  }

  final _timeController = TextEditingController();
}
