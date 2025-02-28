import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_cubit.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_state.dart';
import 'package:x_taxi_app_client/features/account-screen/presentation/account_screen.dart';
import 'package:x_taxi_app_client/features/activity-screen/presentation/activity_screen.dart';
import 'package:x_taxi_app_client/features/home/presentation/pages/homescreen.dart';
import 'package:x_taxi_app_client/features/services/presentation/service_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  void _onItemTapped(BuildContext context, int index) {
    context.read<NavigationCubit>().setIndex(index);

    Widget nextPage;
    switch (index) {
      case 0:
        nextPage = const HomeScreen();
        break;
      case 1:
        nextPage = const ServiceScreen();
        break;
      case 2:
        nextPage = const ActivityScreen();
        break;
      case 3:
        nextPage = const AccountScreen();
        break;
      default:
        return;
    }

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;

          var fadeAnimation = Tween(
            begin: begin,
            end: end,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: curve,
          ));

          var slideAnimation = Tween<Offset>(
            begin: const Offset(0.05, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: curve,
          ));

          return FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: slideAnimation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Container(
          height: 60,
          color: Colors.black,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black, // Add this
            unselectedItemColor: Colors.grey, // Add this
            selectedLabelStyle: textB,
            unselectedLabelStyle: textB,
            showUnselectedLabels: true,
            currentIndex: state.index,
            onTap: (index) => _onItemTapped(context, index),
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/svg/solid/home.svg',
                  width: 22,
                  height: 22,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  width: 22,
                  height: 22,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/svg/solid/services.svg',
                  width: 22,
                  height: 22,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  'assets/svg/services.svg',
                  width: 22,
                  height: 22,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/svg/solid/activity.svg',
                  width: 22,
                  height: 22,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  'assets/svg/activity.svg',
                  width: 22,
                  height: 22,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/svg/solid/user.svg',
                  width: 22,
                  height: 22,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  'assets/svg/user.svg',
                  width: 22,
                  height: 22,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
