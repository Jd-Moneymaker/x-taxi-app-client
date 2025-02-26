import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/utils/bottom_nav_bar.dart';
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
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Taxi App',
              style: textBoldB.copyWith(fontSize: 20),
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Where to?',
                      hintStyle: textBoldB,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      suffixIcon: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.access_time,
                            color: Colors.black,
                            size: 20,
                          ),
                          label: Text(
                            'Now',
                            style: textBoldB.copyWith(fontSize: 14),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 70,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(30, 0, 0, 0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.work,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Saved Places',
                          style: textBoldB.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 16,
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
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(239, 255, 193, 7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              'Try out our membership plans',
                              style: textBoldB.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Save 20% on rides, and more',
                              style: textBoldW.copyWith(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Learn More',
                                style: textBoldW,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 170,
                        height: 170,
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
                            width: 135,
                            height: 135,
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
                                width: 90,
                                height: 90,
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
                                    size: 50,
                                    color: Colors.black45,
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
                            style: textBoldB.copyWith(fontSize: 20),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See all',
                              style: textBoldW.copyWith(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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

                const SizedBox(height: 40),

                // ! ad horizontal
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
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
