import 'package:go_router/go_router.dart';
import 'users_page.dart';

class UsersRoutes {
  static List<GoRoute> routes = [
    GoRoute(path: '/users', builder: (context, state) => const UsersPage()),
  ];
}
