import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/widgets/bottom_nav_bar.dart';
import 'package:x_taxi_app_client/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:x_taxi_app_client/features/auth/presentation/cubit/auth_state.dart';
import 'package:x_taxi_app_client/features/auth/presentation/pages/auth/views/auth.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                ),
                SizedBox(width: 15),
                Text(
                  'Max',
                  style: textBoldB.copyWith(fontSize: 14),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/star.svg',
                        height: 14,
                        width: 14,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '5.0',
                        style: textBoldB.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // ! bottom appbar
        bottomNavigationBar: BottomNavBar(),
        // ! bottom appbar

        // ! main content
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ? account buttons
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AccountButtons(
                      title: 'Help',
                    ),
                    AccountButtons(
                      title: 'Wallet',
                      icon: 'assets/svg/money.svg',
                    ),
                    AccountButtons(
                      title: 'Activity',
                      icon: 'assets/svg/activity.svg',
                    ),
                  ],
                ),
              ),
              // ? account buttons

              // ? banners
              AccountBanner(
                title: 'Safety check-up',
                subTitle: 'Learn ways to make rides safer',
                image: 'assets/svg/clipboard.svg',
              ),
              SizedBox(height: 20),
              AccountBanner(
                title: 'Privacy check-up',
                subTitle: 'Take tour of your privacy settings',
                image: 'assets/svg/lock.svg',
              ),
              // ? banners
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 5,
                  color: Colors.grey[300],
                ),
              ),
              // ! account option items
              AccountOptions(
                title: 'Manage account',
                image: 'assets/svg/user.svg',
              ),
              AccountOptions(
                title: 'Messages',
                image: 'assets/svg/chat.svg',
              ),
              AccountOptions(
                title: 'Settings',
                image: 'assets/svg/settings.svg',
              ),
              AccountOptions(
                title: 'Deliver',
                image: 'assets/svg/truck.svg',
              ),
              AccountOptions(
                title: 'Send a gift',
                image: 'assets/svg/gift.svg',
              ),
              AccountOptions(
                title: 'Legal',
                image: 'assets/svg/info.svg',
              ),

              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedOut) {
                    // Navigate to the AuthScreen after logout
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const AuthScreen()),
                    );
                  } else if (state is AuthError) {
                    // Handle errors (if any)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.toString()}')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                        child:
                            CircularProgressIndicator()); // Show loading spinner
                  }
                  return GestureDetector(
                    onTap: () => context.read<AuthCubit>().logOut(),
                    child: AccountOptions(
                      title: 'Logout',
                      image: 'assets/svg/log-out.svg',
                    ),
                  );
                },
              ),

              // ! account option items
            ],
          ),
        ),
        // ! main content
      );
}

class AccountOptions extends StatelessWidget {
  const AccountOptions({super.key, this.title, this.image, this.onTap});

  final String? title;
  final String? image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            children: [
              SvgPicture.asset(
                image ?? 'assets/svg/settings.svg',
                height: 22,
                width: 22,
              ),
              SizedBox(width: 20),
              Text(
                title ?? '',
                style: textBoldB.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ));
}

class AccountBanner extends StatelessWidget {
  const AccountBanner({super.key, this.title, this.subTitle, this.image});

  final String? title;
  final String? subTitle;
  final String? image;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? '',
                  style: textBoldB.copyWith(fontSize: 12),
                ),
                SizedBox(height: 2),
                Text(
                  subTitle ?? '',
                  style: textB,
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(
                image ?? 'assets/svg/lock.svg',
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      );
}

class AccountButtons extends StatelessWidget {
  const AccountButtons({super.key, this.title, this.icon});

  final String? title;
  final String? icon;

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width / 3.6,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon ?? 'assets/svg/help.svg',
              height: 22,
              width: 22,
            ),
            SizedBox(height: 5),
            Text(
              title ?? '',
              style: textBoldB.copyWith(fontSize: 12),
            ),
          ],
        ),
      );
}
