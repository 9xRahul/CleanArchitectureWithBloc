import 'package:clean_architecture_with_bloc/presentation/bottom_navigation/cubit/navigation_cubit.dart';
import 'package:clean_architecture_with_bloc/presentation/products/screens/products_screen.dart';
import 'package:clean_architecture_with_bloc/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNAvScreen extends StatelessWidget {
  const BottomNAvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: _pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: context.read<BottomNavCubit>().changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  static final List<Widget> _pages = [
    const ProductScreen(),
    const ProfileScreen(),
  ];
}
