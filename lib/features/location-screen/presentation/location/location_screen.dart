import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/features/auth/presentation/widgets/auth_button.dart';
import 'package:x_taxi_app_client/features/location-screen/presentation/widgets/saved_places_card.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(25.5788, 91.8933);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  bool _showPickupSuggestions = false;
  bool _showDestinationSuggestions = false;

  // Demo suggestion data

  final List<LocationSuggestion> suggestions = [
    // Kolkata locations
    LocationSuggestion(
      title: 'Howrah Bridge',
      subtitle: 'Howrah, Kolkata',
      icon: Icons.remove_road,
    ),
    LocationSuggestion(
      title: 'Victoria Memorial',
      subtitle: 'Queen\'s Way, Kolkata',
      icon: Icons.account_balance,
    ),
    LocationSuggestion(
      title: 'Park Street',
      subtitle: 'Central Kolkata',
      icon: Icons.restaurant,
    ),
    LocationSuggestion(
      title: 'Science City',
      subtitle: 'E.M. Bypass, Kolkata',
      icon: Icons.science,
    ),
    LocationSuggestion(
      title: 'Netaji Subhash Chandra Bose Airport',
      subtitle: 'Dum Dum, Kolkata',
      icon: Icons.flight,
    ),
    LocationSuggestion(
      title: 'Eden Gardens Stadium',
      subtitle: 'B.B.D. Bagh, Kolkata',
      icon: Icons.sports_cricket,
    ),
    LocationSuggestion(
      title: 'South City Mall',
      subtitle: 'Prince Anwar Shah Road, Kolkata',
      icon: Icons.shopping_bag,
    ),
    LocationSuggestion(
      title: 'Salt Lake City',
      subtitle: 'Bidhannagar, Kolkata',
      icon: Icons.location_city,
    ),

    // Darjeeling locations
    LocationSuggestion(
      title: 'Tiger Hill',
      subtitle: 'Senchal Forest, Darjeeling',
      icon: Icons.landscape,
    ),
    LocationSuggestion(
      title: 'Batasia Loop',
      subtitle: 'Ghoom, Darjeeling',
      icon: Icons.train,
    ),
    LocationSuggestion(
      title: 'Darjeeling Mall',
      subtitle: 'Chowrasta, Darjeeling',
      icon: Icons.shopping_cart,
    ),
    LocationSuggestion(
      title: 'Himalayan Mountaineering Institute',
      subtitle: 'Jawahar Parbat, Darjeeling',
      icon: Icons.terrain,
    ),

    // Siliguri locations
    LocationSuggestion(
      title: 'Bagdogra Airport',
      subtitle: 'Bagdogra, Siliguri',
      icon: Icons.flight_takeoff,
    ),
    LocationSuggestion(
      title: 'Sevoke Road',
      subtitle: 'Main Market Area, Siliguri',
      icon: Icons.storefront,
    ),
    LocationSuggestion(
      title: 'City Center Mall',
      subtitle: 'Uttorayon Township, Siliguri',
      icon: Icons.shopping_bag,
    ),

    // Dooars and surrounding areas
    LocationSuggestion(
      title: 'Jaldapara National Park',
      subtitle: 'Alipurduar District, West Bengal',
      icon: Icons.forest,
    ),
    LocationSuggestion(
      title: 'Gorumara National Park',
      subtitle: 'Jalpaiguri District, West Bengal',
      icon: Icons.pets,
    ),

    // Digha beach locations
    LocationSuggestion(
      title: 'Digha Beach',
      subtitle: 'East Medinipur District, West Bengal',
      icon: Icons.beach_access,
    ),
    LocationSuggestion(
      title: 'New Digha',
      subtitle: 'Beach Resort Area, East Medinipur',
      icon: Icons.holiday_village,
    ),

    // Sundarbans
    LocationSuggestion(
      title: 'Sundarbans National Park',
      subtitle: 'South 24 Parganas District, West Bengal',
      icon: Icons.water,
    ),
    LocationSuggestion(
      title: 'Sajnekhali Tiger Reserve',
      subtitle: 'Sundarbans, West Bengal',
      icon: Icons.pets,
    ),

    // Murshidabad
    LocationSuggestion(
      title: 'Hazarduari Palace',
      subtitle: 'Murshidabad, West Bengal',
      icon: Icons.account_balance,
    ),
    LocationSuggestion(
      title: 'Katra Mosque',
      subtitle: 'Murshidabad, West Bengal',
      icon: Icons.mosque,
    ),

    // More Kolkata locations
    LocationSuggestion(
      title: 'College Street',
      subtitle: 'North Kolkata',
      icon: Icons.menu_book,
    ),
    LocationSuggestion(
      title: 'Eco Park',
      subtitle: 'New Town, Kolkata',
      icon: Icons.park,
    ),
    LocationSuggestion(
      title: 'Kalighat Temple',
      subtitle: 'Kalighat, Kolkata',
      icon: Icons.temple_hindu,
    ),
    LocationSuggestion(
      title: 'Quest Mall',
      subtitle: 'Ballygunge, Kolkata',
      icon: Icons.shopping_bag,
    ),
    LocationSuggestion(
      title: 'Nicco Park',
      subtitle: 'Salt Lake, Kolkata',
      icon: Icons.attractions,
    ),
    LocationSuggestion(
      title: 'Jadavpur University',
      subtitle: 'Jadavpur, Kolkata',
      icon: Icons.school,
    ),
    LocationSuggestion(
      title: 'Indian Museum',
      subtitle: 'Jawaharlal Nehru Road, Kolkata',
      icon: Icons.museum,
    ),
    LocationSuggestion(
      title: 'Dakshineswar Kali Temple',
      subtitle: 'Dakshineswar, Kolkata',
      icon: Icons.temple_hindu,
    ),
    LocationSuggestion(
      title: 'Belur Math',
      subtitle: 'Belur, Howrah',
      icon: Icons.temple_hindu,
    ),

    // Shantiniketan
    LocationSuggestion(
      title: 'Visva-Bharati University',
      subtitle: 'Shantiniketan, Birbhum',
      icon: Icons.school,
    ),
    LocationSuggestion(
      title: 'Tagore\'s Ashrama',
      subtitle: 'Shantiniketan, Birbhum',
      icon: Icons.holiday_village,
    ),

    // Durgapur & Asansol
    LocationSuggestion(
      title: 'City Center Durgapur',
      subtitle: 'Durgapur, West Bengal',
      icon: Icons.shopping_bag,
    ),
    LocationSuggestion(
      title: 'Burnpur Steel Plant',
      subtitle: 'IISCO, Asansol',
      icon: Icons.factory,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pickupController.addListener(_onPickupChanged);
    _destinationController.addListener(_onDestinationChanged);
  }

  void _onPickupChanged() {
    setState(() {
      _showPickupSuggestions = _pickupController.text.isNotEmpty;
      _showDestinationSuggestions = false; // Hide other suggestions
    });
  }

  void _onDestinationChanged() {
    setState(() {
      _showDestinationSuggestions = _destinationController.text.isNotEmpty;
      _showPickupSuggestions = false; // Hide other suggestions
    });
  }

  @override
  void dispose() {
    _pickupController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 12.5,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 1.0,
              minChildSize: 0.4,
              maxChildSize: 1.0,
              snap: true,
              snapSizes: [0.4, 1.0],
              builder: (context, scrollController) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    // This prevents the inner content from scrolling
                    if (notification.depth > 0) return true;
                    return false;
                  },
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: ClampingScrollPhysics(),
                    child: Container(
                      // Set a fixed height so the content doesn't scroll internally
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // ! notch
                          Center(
                            child: Container(
                              width: 40,
                              height: 5,
                              margin: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          // ! notch
                          // ! appbar
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_outlined,
                                    size: 16,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Plan your ride',
                                      style: textBoldB.copyWith(fontSize: 16),
                                    ),
                                  ),
                                ),
                                // Add an empty SizedBox with the same width as the IconButton
                                // to ensure the title stays centered
                                SizedBox(width: 48), // IconButton default size
                              ],
                            ),
                          ),
                          // ! appbar
                          // ! location fields
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 20),
                            height: 60,
                            child: TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              style: textBoldB,
                              controller: _pickupController,
                              cursorColor: Colors.black,
                              decoration: textfieldDecoration.copyWith(
                                hintText: 'Your location',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    'assets/svg/solid/user.svg',
                                    width: 8,
                                    height: 8,
                                  ),
                                ),
                                suffixIcon: _pickupController.text.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.clear,
                                            color: Colors.black54, size: 16),
                                        onPressed: () {
                                          _pickupController.clear();
                                        },
                                      )
                                    : null,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 20),
                            height: 60,
                            child: TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              style: textBoldB,
                              controller: _destinationController,
                              cursorColor: Colors.black,
                              decoration: textfieldDecoration.copyWith(
                                hintText: 'Where to?',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    'assets/svg/solid/location.svg',
                                    width: 14,
                                    height: 14,
                                  ),
                                ),
                                suffixIcon:
                                    _destinationController.text.isNotEmpty
                                        ? IconButton(
                                            icon: Icon(Icons.clear,
                                                color: Colors.black54,
                                                size: 16),
                                            onPressed: () {
                                              _destinationController.clear();
                                            },
                                          )
                                        : null,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SavedPlacesCard(
                                  image: 'assets/svg/solid/work.svg',
                                  title: 'Work',
                                  subtitle: 'Laitumkhrah',
                                ),
                                SavedPlacesCard(
                                  image: 'assets/svg/solid/home.svg',
                                  title: 'Home',
                                  subtitle: 'Madanrting',
                                ),
                                SavedPlacesCard(
                                  image: 'assets/svg/solid/bookmark.svg',
                                  title: 'Saved',
                                ),
                                SavedPlacesCard(
                                  image: 'assets/svg/solid/add.svg',
                                  title: 'Add',
                                ),
                              ],
                            ),
                          ),

                          // ! location suggestions => outputs the suggestions when user is typing on the textfields
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              // Use ListView.builder instead of Column for better performance with long lists
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  // Only show suggestions if typing
                                  if (_showPickupSuggestions ||
                                      _showDestinationSuggestions)
                                    ...List.generate(
                                        _getFilteredSuggestions().length,
                                        (index) {
                                      final filteredSuggestions =
                                          _getFilteredSuggestions();
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (index > 0) Divider(height: 1),
                                          LocationSuggestionTile(
                                            suggestion:
                                                filteredSuggestions[index],
                                            onTap: () {
                                              final text =
                                                  filteredSuggestions[index]
                                                      .title;
                                              if (_showPickupSuggestions) {
                                                _pickupController.text = text;
                                              } else {
                                                _destinationController.text =
                                                    text;
                                              }
                                              setState(() {
                                                _showPickupSuggestions = false;
                                                _showDestinationSuggestions =
                                                    false;
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    }),

                                  // Always show these two items at the end
                                  Divider(height: 1),
                                  ListTile(
                                    onTap: () {},
                                    leading: SvgPicture.asset(
                                      'assets/svg/solid/earth.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                    title: Text(
                                      'Search in different city',
                                      style: textBoldB,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                  ),
                                  Divider(height: 1),
                                  ListTile(
                                    onTap: () {},
                                    leading: SvgPicture.asset(
                                      'assets/svg/solid/map.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                    title: Text(
                                      'Select location on map',
                                      style: textBoldB,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: AuthButton(
                              bgColor: Colors.black,
                              title: 'Confirm ride',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<LocationSuggestion> _getFilteredSuggestions() {
    final String query = _showPickupSuggestions
        ? _pickupController.text.toLowerCase()
        : _destinationController.text.toLowerCase();

    if (query.isEmpty) {
      return suggestions;
    }

    return suggestions.where((suggestion) {
      return suggestion.title.toLowerCase().contains(query) ||
          suggestion.subtitle.toLowerCase().contains(query);
    }).toList();
  }
}

class LocationSuggestion {
  final String title;
  final String subtitle;
  final IconData icon;

  LocationSuggestion({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class LocationSuggestionTile extends StatelessWidget {
  final LocationSuggestion suggestion;
  final VoidCallback onTap;

  const LocationSuggestionTile({
    super.key,
    required this.suggestion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(suggestion.icon, color: Colors.black54),
      title: Text(
        suggestion.title,
        style: textBoldB,
      ),
      subtitle: Text(
        suggestion.subtitle,
        style: textB,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}

InputDecoration get textfieldDecoration => InputDecoration(
      prefixStyle: textB,
      counterText: '',
      hintStyle: textBoldB,
      fillColor: Colors.grey[200], // Lighter grey color
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // Adding border radius
        borderSide: BorderSide.none, // No visible border
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // Adding border radius
        borderSide: BorderSide.none, // No visible border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // Adding border radius
        borderSide: BorderSide.none, // No visible border
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // Adding border radius
        borderSide: BorderSide.none, // No visible border
      ),
    );
