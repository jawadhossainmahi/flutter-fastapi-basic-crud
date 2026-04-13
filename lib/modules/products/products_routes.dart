import 'package:go_router/go_router.dart';
import 'products_page.dart';

class ProductsRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsPage(),
    ),
  ];
}
