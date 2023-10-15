import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:injectable/injectable.dart';
import 'package:more_tech_front/features/office_overview/data/dto/optimal_office_dto.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';
import 'package:more_tech_front/features/office_overview/domain/models/service/product.dart';
import 'package:more_tech_front/features/office_overview/domain/repositories/offices_repository.dart';

import '../../domain/models/working_hours/working_hours.dart';

@Injectable(as: OfficesRepository)
class OfficesRepositoryMock implements OfficesRepository {
  @override
  Future<List<Office>> getOffices() {
    return Future(
      () => [
        Office(
          id: 1,
          name: 'ДО «Солнечногорский» Филиала № 7701 Банка ВТБ (ПАО)',
          address:
              '141506, Московская область, г. Солнечногорск, ул. Красная, д. 60',
          workingHours: [
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПН'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ВТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СР'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ЧТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СБ'),
            WorkingHours(day: 'ВС'),
          ],
          latitude: 56.184479,
          longitude: 36.984314,
        ),
        Office(
          id: 2,
          name: 'ДО «На Баранова» Филиала № 7701 Банка ВТБ (ПАО)',
          address:
              '141500, Московская область, г. Солнечногорск, ул. Баранова, д. 1, 1-й этаж',
          workingHours: [
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПН'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ВТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СР'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ЧТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СБ'),
            WorkingHours(day: 'ВС'),
          ],
          latitude: 56.183239,
          longitude: 36.9757,
        ),
        Office(
          id: 3,
          name: 'ДО «Лобня» Филиала № 7701 Банка ВТБ (ПАО)',
          address: '141730, Московская область, г. Лобня, ул. Ленина, д. 9',
          workingHours: [
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПН'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ВТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СР'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ЧТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СБ'),
            WorkingHours(day: 'ВС'),
          ],
          latitude: 56.012386,
          longitude: 37.482059,
        ),
        Office(
          id: 4,
          name: 'ДО «Черноголовский» Филиала № 7701 Банка ВТБ (ПАО)',
          address:
              '142432, Московская область, г. Черноголовка, пр-д Строителей, д. 1б',
          workingHours: [
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПН'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ВТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СР'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ЧТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СБ'),
            WorkingHours(day: 'ВС'),
          ],
          latitude: 56.011509,
          longitude: 38.377728,
        ),
        Office(
          id: 5,
          name: 'ДО «Пушкинский» Филиала № 7701 Банка ВТБ (ПАО)',
          address:
              '141207, Московская область, г. Пушкино, ул. Тургенева, д. 24, пом. 018',
          workingHours: [
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПН'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ВТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СР'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ЧТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'ПТ'),
            WorkingHours(
                begin: DateTime.now().copyWith(
                  hour: 9,
                  minute: 0,
                ),
                end: DateTime.now().copyWith(
                  hour: 18,
                  minute: 0,
                ),
                day: 'СБ'),
            WorkingHours(day: 'ВС'),
          ],
          latitude: 56.010849,
          longitude: 37.854359,
        ),
      ],
    );
  }

  @override
  Future<List<Product>> getAllProducts() {
    return Future(
      () => [
        "Кредит",
        "Ипотека",
        "Вклады и счета",
        "Другие услуги",
        "Открыть счет",
        "Регистрация бизнеса",
        "Оформить кредит для бизнеса"
      ]
          .map(
            (e) => Product(name: e),
          )
          .toList(),
    );
  }

  @override
  Future<List<OptimalOfficeDto>> getOptimalOffices(
      Product product, DateTime dateTime, LatLng position, double radius) {
    return Future(
      () => [
        OptimalOfficeDto(
          office: Office(
            id: 5,
            name: 'ДО «Пушкинский» Филиала № 7701 Банка ВТБ (ПАО)',
            address:
                '141207, Московская область, г. Пушкино, ул. Тургенева, д. 24, пом. 018',
            workingHours: [
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'ПН'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'ВТ'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'СР'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'ЧТ'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'ПТ'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'СБ'),
              WorkingHours(day: 'ВС'),
            ],
            latitude: 56.010849,
            longitude: 37.854359,
          ),
          estimatedTime: 1000,
        ),
        OptimalOfficeDto(
          office: Office(
            id: 4,
            name: 'ДО «Черноголовский» Филиала № 7701 Банка ВТБ (ПАО)',
            address:
            '142432, Московская область, г. Черноголовка, пр-д Строителей, д. 1б',
            workingHours: [
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'ПН'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'ВТ'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'СР'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'ЧТ'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'ПТ'),
              WorkingHours(
                  begin: DateTime.now().copyWith(
                    hour: 9,
                    minute: 0,
                  ),
                  end: DateTime.now().copyWith(
                    hour: 18,
                    minute: 0,
                  ),
                  day: 'СБ'),
              WorkingHours(day: 'ВС'),
            ],
            latitude: 56.011509,
            longitude: 38.377728,
          ),
          estimatedTime: 1200,
        ),
      ],
    );
  }
}
