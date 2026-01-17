import 'package:go_router/go_router.dart';
import '../presentation/pages/splash/splash_page.dart';
import '../presentation/pages/onboarding/onboarding_page.dart';
import '../presentation/pages/auth/login_page.dart';
import '../presentation/pages/auth/register_page.dart';
import '../presentation/pages/main_navigation/main_navigation_page.dart';
import '../presentation/pages/products/products_page.dart';
import '../presentation/pages/products/product_detail_page.dart';
import 'package:flutter/material.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  observers: [routeObserver],
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashPage()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final tabParam = state.uri.queryParameters['tab'];
        final initialIndex = tabParam != null ? int.tryParse(tabParam) ?? 0 : 0;
        return MainNavigationPage(initialIndex: initialIndex);
      },
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) {
        final category = state.extra as String?;
        return ProductsPage(category: category);
      },
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ProductDetailPage(productId: id);
      },
    ),
  ],
);
