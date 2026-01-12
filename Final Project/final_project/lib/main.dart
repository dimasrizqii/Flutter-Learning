import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'core/router.dart';
import 'core/theme/app_theme.dart';
import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'firebase_options.dart';
import 'presentation/blocs/auth/auth_bloc.dart';
import 'presentation/blocs/auth/auth_event.dart';
import 'presentation/blocs/product/product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(AppStarted())),
        BlocProvider(
          create: (context) => ProductBloc(
            productRepository: ProductRepositoryImpl(
              remoteDataSource: ProductRemoteDataSourceImpl(
                client: http.Client(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'ShopApp',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
