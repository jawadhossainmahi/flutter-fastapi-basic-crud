import 'package:flutter/material.dart';
import 'app_router.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const CrudPracticeApp());
}

class CrudPracticeApp extends StatelessWidget {
  const CrudPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CRUD Practice',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}

class RootScaffold extends StatelessWidget {
  final Widget child;
  const RootScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Use GoRouterState.of(context).location instead of GoRouter.of(context).location
    final location = GoRouterState.of(context).uri.toString();
    int currentIndex = location.startsWith('/products') ? 1 : 0;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) {
            context.go('/users');
          } else {
            context.go('/products');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
        ],
      ),
    );
  }
}
