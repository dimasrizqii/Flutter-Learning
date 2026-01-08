import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/navigation/navigation_bloc.dart';
import '../blocs/navigation/navigation_state.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell shell;

  const MainPage({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: shell,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index, // BLoC state
              onTap: (newIndex) {
                context.read<NavigationBloc>().setIndex(newIndex);

                /// NAVIGASI GoRouter berdasarkan index
                shell.goBranch(
                  newIndex,
                  initialLocation: newIndex == shell.currentIndex
                      ? false
                      : true,
                );
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: "Order",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
