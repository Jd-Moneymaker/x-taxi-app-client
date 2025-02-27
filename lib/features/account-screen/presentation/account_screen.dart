import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/widgets/bottom_nav_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                  style: textBoldB.copyWith(fontSize: 20),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 70,
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
                  children: [
                    AccountButtons(
                      title: 'Help',
                    ),
                    SizedBox(width: 20),
                    AccountButtons(
                      title: 'Wallet',
                      icon: 'assets/svg/money.svg',
                    ),
                    SizedBox(width: 20),
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
              // ! account option items
            ],
          ),
        ),
        // ! main content
      );
}

class AccountOptions extends StatelessWidget {
  const AccountOptions({super.key, this.title, this.image});

  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            children: [
              SvgPicture.asset(
                image ?? 'assets/svg/settings.svg',
                height: 24,
                width: 24,
              ),
              SizedBox(width: 20),
              Text(
                title ?? '',
                style: textBoldB.copyWith(fontSize: 16),
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
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? '',
                  style: textBoldB.copyWith(fontSize: 18),
                ),
                Text(
                  subTitle ?? '',
                  style: textB.copyWith(fontSize: 12),
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
        width: MediaQuery.of(context).size.width * 0.27,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon ?? 'assets/svg/help.svg',
              height: 24,
              width: 24,
            ),
            SizedBox(height: 10),
            Text(
              title ?? '',
              style: textBoldB.copyWith(fontSize: 16),
            ),
          ],
        ),
      );
}
