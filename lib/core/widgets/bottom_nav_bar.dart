import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_cubit.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_state.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  void _onItemTapped(BuildContext context, int index) {
    context.read<NavigationCubit>().setIndex(index);

    switch (index) {
      case 0:
        Navigator.of(context).popAndPushNamed('/');
        break;
      case 1:
        Navigator.of(context).popAndPushNamed('service-screen');
        break;
      case 2:
        Navigator.of(context).popAndPushNamed('activity-screen');
        break;
      case 3:
        Navigator.of(context).popAndPushNamed('account-screen');
        break;

      default:
        break;
    }
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
