import 'package:injectable/injectable.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';
import 'package:more_tech_front/features/office_overview/domain/repositories/offices_repository.dart';

@Injectable(as: OfficesRepository)
class OfficesRepositoryMock implements OfficesRepository {
  @override
  Future<List<Office>> getOffices() {
    return Future(
      () => const [
        Office(
          id: 1,
          name: 'ДО «Солнечногорский» Филиала № 7701 Банка ВТБ (ПАО)',
          address: '141506, Московская область, г. Солнечногорск, ул. Красная, д. 60',
          workingHours: [],
          latitude: 56.184479,
          longitude: 36.984314,
        ),
        Office(
          id: 2,
          name: 'ДО «На Баранова» Филиала № 7701 Банка ВТБ (ПАО)',
          address: '141500, Московская область, г. Солнечногорск, ул. Баранова, д. 1, 1-й этаж',
          workingHours: [],
          latitude: 56.183239,
          longitude: 36.9757,
        ),
        Office(
          id: 3,
          name: 'ДО «Лобня» Филиала № 7701 Банка ВТБ (ПАО)',
          address: '141730, Московская область, г. Лобня, ул. Ленина, д. 9',
          workingHours: [],
          latitude: 56.012386,
          longitude: 37.482059,
        ),
        Office(
          id: 4,
          name: 'ДО «Черноголовский» Филиала № 7701 Банка ВТБ (ПАО)',
          address: '142432, Московская область, г. Черноголовка, пр-д Строителей, д. 1б',
          workingHours: [],
          latitude: 56.011509,
          longitude: 38.377728,
        ),
        Office(
          id: 5,
          name: 'ДО «Пушкинский» Филиала № 7701 Банка ВТБ (ПАО)',
          address: '141207, Московская область, г. Пушкино, ул. Тургенева, д. 24, пом. 018',
          workingHours: [],
          latitude: 56.010849,
          longitude: 37.854359,
        ),
      ],
    );
  }
}
