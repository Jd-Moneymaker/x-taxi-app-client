import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/widgets/bottom_nav_bar.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            'Activity',
            style: textBoldB.copyWith(fontSize: 24),
          ),
          centerTitle: false,
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ActivityHeading(),
              ActivityCard(
                place: 'Aliapurduar',
                dateTime: '12th June . 10:59 am',
                price: '₹ 500 . 00  .  Dropped',
                image: 'assets/png/map.png',
              ),
              ActivityCard(
                place: 'Gurugram',
                dateTime: '18th Febuary . 7:20 pm',
                price: '₹ 2300 . 00  .  Dropped',
                image: 'assets/png/map2.png',
              ),
            ],
          ),
        ),
      );
}

class ActivityCard extends StatelessWidget {
  const ActivityCard(
      {super.key, this.place, this.dateTime, this.price, this.image});

  final String? place;
  final String? dateTime;
  final String? price;
  final String? image;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ! image
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image ?? 'assets/png/map.png',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // ! image
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place ?? '',
                        style: textBoldB.copyWith(fontSize: 18),
                      ),
                      Text(
                        dateTime ?? '',
                        style: textB.copyWith(fontSize: 12),
                      ),
                      Text(
                        price ?? '',
                        style: textB.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Rebook',
                      style: textW.copyWith(fontSize: 12),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              )
            ],
          ),
        ),
      );
}

class ActivityHeading extends StatelessWidget {
  const ActivityHeading({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Past',
              style: textBoldB.copyWith(fontSize: 18),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/filter.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      );
}
