import 'package:clean_architecture_with_bloc/core/di/app_depandencies.dart';
import 'package:clean_architecture_with_bloc/core/routes/app_router.dart';
import 'package:clean_architecture_with_bloc/core/routes/route_names.dart';
import 'package:clean_architecture_with_bloc/core/storage/secure_auth_storage.dart';
import 'package:clean_architecture_with_bloc/presentation/app_start/cubit/app_start_cubit.dart';
import 'package:clean_architecture_with_bloc/presentation/bottom_navigation/cubit/navigation_cubit.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/category/catogory_bloc.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/products/products_bloc.dart';
import 'package:clean_architecture_with_bloc/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/login/bloc/login_bloc.dart';






void main() {
  final deps = AppDependencies();
  runApp(MyApp(deps: deps));
}

class MyApp extends StatelessWidget {
  final AppDependencies deps;

  const MyApp({super.key, required this.deps});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc(deps.login.loginUser)),
        BlocProvider(create: (_) => AppStartCubit(SecureAuthStorage())),

        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(
          create: (_) => ProfileBloc(
            deps.profileDependencies.getProfile,
            deps.profileDependencies.logoutUser,
          ),
        ),

        BlocProvider(
          create: (context) =>
              ProductsBloc(deps.productDependencies.getProducts,deps.productDependencies.searchProducts),
        ),
        BlocProvider(
          create: (context) =>
              CategoryBloc(deps.categoryDependencies.getCategories),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.appStartScreen,
        onGenerateRoute: AppRouter.generateRoutes,
      ),
    );
  }
}
