import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/widgets/bottom_nav_bar.dart';
import '../widgets/ad_card.dart';
import '../widgets/vehicle_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Taxi App',
              style: textBoldB.copyWith(fontSize: 16),
            ),
          ),
        ),

        // ! bottom nav bar
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: const BottomNavBar(),
        ),
        // ! bottom nav bar

        // ! main container => column => scrollview
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(20, 255, 255, 255),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ! search bar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      style: textBoldB,
                      decoration: InputDecoration(
                        hintText: 'Where to?',
                        hintStyle: textBoldB,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15), // Add this
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 16,
                        ),
                        suffixIcon: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Now',
                                  style: textBoldB,
                                ),
                              ],
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(12, 0, 0, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                // ! search bar

                // ! saved address
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(30, 0, 0, 0),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 55,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(12, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/bag.svg',
                            width: 12,
                            height: 12,
                            colorFilter:
                                ColorFilter.mode(Colors.black, BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Saved Places',
                          style: textBoldB,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                // ! saved address

                // ! banner
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(239, 255, 193, 7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              'Try out our membership plans',
                              style: textBoldB.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Save 20% on rides, prepaid bookings and more',
                              style: textBoldW,
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 30,
                              width: 90,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                ),
                                child: const Text(
                                  'Learn More',
                                  style: textW,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.amber.shade400,
                                Colors.amber.shade400,
                                Colors.amber.shade400,
                              ],
                              stops: const [0.0, 0.7, 1.0],
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    Colors.amber.shade300,
                                    Colors.amber.shade300,
                                    Colors.amber.shade300,
                                  ],
                                  stops: const [0.0, 0.6, 1.0],
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      colors: [
                                        Colors.amber.shade100,
                                        Colors.amber.shade200,
                                        Colors.amber.shade200,
                                      ],
                                      stops: const [0.0, 0.5, 1.0],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.local_offer_outlined,
                                      size: 30,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ! banner

                // ! services
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Services',
                            style: textBoldB.copyWith(fontSize: 12),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See all',
                              style: textBoldW.copyWith(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VehicleCard(
                            title: 'Trip',
                            image:
                                'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/Hatchback.png',
                          ),
                          VehicleCard(
                            title: 'Intercity',
                            image:
                                'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/package_UberXL_new_2022.png',
                          ),
                          VehicleCard(
                            title: 'Moto',
                            image:
                                'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/v1.1/Motorcycle.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //  ! services

                const SizedBox(height: 20),

                // ! ad horizontal
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      AdCard(
                        title: 'Save time and money',
                        image:
                            'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/v1.1/Motorcycle.png',
                      ),
                      SizedBox(width: 25),
                      AdCard(
                        title: 'Safety and comfort',
                        image:
                            'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/Hatchback.png',
                      ),
                      SizedBox(width: 25),
                      AdCard(
                        title: 'Airport trips and more',
                        image:
                            'https://d1a3f4spazzrp4.cloudfront.net/car-types/haloProductImages/Hatchback.png',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // ! ad horizontal
              ],
            ),
          ),
        ),

        // ! main container
      );
}
