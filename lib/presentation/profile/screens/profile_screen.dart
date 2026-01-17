import 'package:clean_architecture_with_bloc/core/routes/route_names.dart';
import 'package:clean_architecture_with_bloc/core/utils/snack_bar.dart';
import 'package:clean_architecture_with_bloc/presentation/bottom_navigation/cubit/navigation_cubit.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/products/products_bloc.dart';
import 'package:clean_architecture_with_bloc/presentation/profile/screens/widgets/profile_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileFetchingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          TextButton(
            onPressed: () {
              context.read<ProductsBloc>().add(ClearProductsList());

              context.read<ProfileBloc>().add(LogoutEvent());
            },
            child: const Row(
              children: [
                Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.logout, size: 20),
              ],
            ),
          ),
        ],
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // ✅ Navigate on logout success
          if (state is LogoutSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.login,
              (_) => false,
            );
          }

          // Optional: show error snackbar
          if (state is LogoutFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          // ✅ Loading profile
          if (state is ProfileLoding) {
            return const Center(child: CircularProgressIndicator());
          }

          // ✅ Logout loading
          if (state is LogoutLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileLoddingError) {
            if (state.statusCode == 401) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showSnackBar(
                  context,
                  "${state.message} Please login to continue",
                );
                context.read<ProfileBloc>().add(LogoutEvent());
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.login,
                  (route) => false,
                );
              });
            }
          }

          // ✅ Profile loaded
          if (state is ProfileLogingSuccess) {
            return ProfileView(user: state.loggedUser);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
