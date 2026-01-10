import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_15_structure_code/core/injection_container.dart' as di;
import 'package:tugas_15_structure_code/presentation/blocs/comment/comment_bloc.dart';
import 'package:tugas_15_structure_code/presentation/blocs/post/post_bloc.dart';
import 'package:tugas_15_structure_code/routes/app_router.dart';

void main() {
  di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PostBloc>()),
        BlocProvider(create: (_) => di.sl<CommentBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Sanbercode Rest API',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6C5CE7),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF0F0F23),
        ),
        routerConfig: router,
      ),
    );
  }
}
