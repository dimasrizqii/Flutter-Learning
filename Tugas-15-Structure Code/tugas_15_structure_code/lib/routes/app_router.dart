import 'package:go_router/go_router.dart';
import 'package:tugas_15_structure_code/presentation/pages/home_page.dart';
import 'package:tugas_15_structure_code/presentation/pages/post_detail_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/post/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return PostDetailPage(postId: id);
      },
    ),
  ],
);
