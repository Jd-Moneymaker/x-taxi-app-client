import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_cubit.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_state.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  void _onItemTapped(BuildContext context, int index) {
    context.read<NavigationCubit>().setIndex(index);

    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('/');
        break;
      case 1:
        Navigator.of(context).pushNamed('service-screen');
        break;
      case 2:
        Navigator.of(context).pushNamed('service-screen');
        break;
      case 3:
        Navigator.of(context).pushNamed('service-screen');
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
          height: 70,
          color: Colors.black,
          child: BottomNavigationBar(
            backgroundColor: null,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black, // Add this
            unselectedItemColor: Colors.grey, // Add this
            showUnselectedLabels: true,
            currentIndex: state.index,
            onTap: (index) => _onItemTapped(context, index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.view_compact),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
