import 'package:clean_architecture_with_bloc/core/enums/auth_state.dart';
import 'package:clean_architecture_with_bloc/presentation/app_start/cubit/app_start_cubit.dart';
import 'package:clean_architecture_with_bloc/presentation/bottom_navigation/screen/bottom_nav_screen.dart';
import 'package:clean_architecture_with_bloc/presentation/login/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStartScreen extends StatefulWidget {
  const AppStartScreen({super.key});

  @override
  State<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AppStartCubit>().checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStartCubit, AuthState>(
      builder: (context, state) {
        switch (state) {
          case AuthState.loading:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case AuthState.authenticated:
            return const BottomNAvScreen();
          case AuthState.unauthenticated:
            return const LoginScreen();
        }
      },
    );
  }
}
