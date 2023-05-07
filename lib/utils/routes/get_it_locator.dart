import 'package:get_it/get_it.dart';
import 'package:sporter_turf_booking/utils/routes/navigation_services.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton<NavigationServices>(() => NavigationServices());
}
