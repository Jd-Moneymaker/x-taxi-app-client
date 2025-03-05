import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/widgets/bottom_nav_bar.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Activity',
              style: headerBoldB,
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Past',
                      style: headerBoldB,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/svg/filter.svg',
                        width: 24,
                        height: 24,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
              ActivityCard(
                place: 'Howrah',
                dateTime: '12th June . 10:59 am',
                price: '₹ 500 . 00  .  Dropped',
                image: 'assets/png/howrah.png',
              ),
              ActivityCard(
                place: 'Gurugram',
                dateTime: '18th Febuary . 7:20 pm',
                price: '₹ 2300 . 00  .  Dropped',
                image: 'assets/png/gurugram.png',
              ),
              ActivityCard(
                place: 'Church Street',
                dateTime: '3rd January . 2:30 pm',
                price: '₹ 3499 . 20  .  Dropped',
                image: 'assets/png/church street.png',
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
        height: MediaQuery.of(context).size.height * 0.3,
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
                    image ?? '',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // ! image

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place ?? '',
                          style: textBoldB,
                        ),
                        Text(
                          dateTime ?? '',
                          style: textB,
                        ),
                        Text(
                          price ?? '',
                          style: textB,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 30,
                    width: 70,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Rebook',
                        style: textW,
                      ),
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
