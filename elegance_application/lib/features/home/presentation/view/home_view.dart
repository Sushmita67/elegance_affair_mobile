import 'package:elegance_application/core/common/snackbar/snackbar.dart';
import 'package:elegance_application/features/home/presentation/view_model/home_cubit.dart';
import 'package:elegance_application/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/logo-4.svg',
              height: 80,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout code
              showMySnackBar(
                context: context,
                message: 'Logging out...',
                color: Colors.red,
              );

              context.read<HomeCubit>().logout(context);
            },
          ),
          Switch(
            value: _isDarkTheme,
            onChanged: (value) {
              // Change theme
              // setState(() {
              //   _isDarkTheme = value;
              // });
            },
          ),
        ],
      ),
      // body: _views.elementAt(_selectedIndex),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return state.views.elementAt(state.selectedIndex);
      }),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.production_quantity_limits,
                ),
                label: 'cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.collections_outlined,
                ),
                label: 'product',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: 'About Us',
              ),
            ],
            backgroundColor: Colors.black,
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.black,
            currentIndex: state.selectedIndex,
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
            // currentIndex: state.selectedIndex,
            // selectedItemColor: Colors.white,
            // onTap: (index) {
            //   context.read<HomeCubit>().onTabTapped(index);
            // },
          );
        },
      ),
    );
  }
}
