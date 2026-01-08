import 'package:go_router/go_router.dart';

import '../ui/main_page.dart';
import '../ui/home_page.dart';
import '../ui/order_page.dart';
import '../ui/profile_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainPage(shell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: '/home', builder: (_, _) => const HomePage())],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(path: '/order', builder: (_, _) => const OrderPage()),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(path: '/profile', builder: (_, _) => const ProfilePage()),
          ],
        ),
      ],
    ),
  ],
);
