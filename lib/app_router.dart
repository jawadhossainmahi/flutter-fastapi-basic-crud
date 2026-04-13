import 'package:go_router/go_router.dart';
import 'modules/users/users_page.dart';
import 'modules/products/products_page.dart';
import 'main.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/users',
      builder: (context, state) => RootScaffold(child: const UsersPage()),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => RootScaffold(child: const ProductsPage()),
    ),
  ],
  initialLocation: '/users',
);
