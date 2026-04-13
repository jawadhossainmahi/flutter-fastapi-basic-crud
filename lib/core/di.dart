import 'package:get_it/get_it.dart';
import '../modules/users/users_service.dart';
import '../modules/products/products_service.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton(() => UsersService());
  getIt.registerLazySingleton(() => ProductsService());
}
