import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/models/vet_clinic.dart';
import 'package:vet_bookr/oScreens/vetMaps.dart';

class PetParksPage extends StatefulWidget {
  const PetParksPage({super.key});

  @override
  State<PetParksPage> createState() => _PetParksPageState();
}

class _PetParksPageState extends State<PetParksPage>
    with WidgetsBindingObserver {
  bool isLoading = true;
  String? errorMessage;

  String dropdownvalue = 'in 2.5Kms';
  int apiChanger = 2500;

  final List<String> apis = [
    'in 2.5Kms',
    'in 5Kms',
    'in 10Kms',
  ];

  List<VetClinic> vetClinic = [];
  List<double>? currentLatLng;

  static const String _kLocationServicesDisabledMessage =
      'Phone location is turned off. Please turn it on to view nearby pet-friendly parks.';
  static const String _kPermissionDeniedMessage =
      'Location permission was denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Location permission is permanently denied. Please enable it from app settings.';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getTotalData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getTotalData();
    }
  }

  Future<void> _showLocationOffDialog() async {
    if (!mounted) return;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Location is turned off'),
        content: const Text(
          'Please turn on your phone location to find nearby pet-friendly parks.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await Geolocator.openLocationSettings();
            },
            child: const Text('Turn On'),
          ),
        ],
      ),
    );
  }

  Future<void> _showPermissionDeniedForeverDialog() async {
    if (!mounted) return;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Location permission required'),
        content: const Text(
          "Location permission has been permanently denied or your phone's location services are disabled. Please enable it from app settings or Settings > Privacy & Security > Location Services and turn it on.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await Geolocator.openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  Future<Position?> determinePosition() async {
    final bool isLocationEnabled =
    await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      await _showLocationOffDialog();
      return null;
    }

    LocationPermission locationPermission =
    await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    if (locationPermission == LocationPermission.denied) {
      return null;
    }

    if (locationPermission == LocationPermission.deniedForever) {
      await _showPermissionDeniedForeverDialog();
      return null;
    }

    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (_) {
      return await Geolocator.getLastKnownPosition();
    }
  }

  Future<List<double>?> getLatLng() async {
    final Position? position = await determinePosition();

    if (position == null) return null;

    return [position.latitude, position.longitude];
  }

  Future<void> getTotalData() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final List<double>? latLng = await getLatLng();

      if (latLng == null) {
        if (!mounted) return;
        setState(() {
          isLoading = false;
          errorMessage = 'Please turn on your phone location to continue using this feature.';
        });
        return;
      }

      currentLatLng = latLng;

      final String vetsUrl =
          "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=pet+boarding&location=${latLng[0]},${latLng[1]}&radius=$apiChanger&type=pet_boarding&key=${Constants.apiKey}";
      final response = await http
          .get(Uri.parse(vetsUrl))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        throw Exception('Failed to load pet-friendly parks. Server error ${response.statusCode}.');
      }

      final decodedBody = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> data = jsonDecode(decodedBody);

      if (data["results"] == null || data["results"] is! List) {
        throw Exception('No pet-friendly parks found right now.');
      }

      final List<VetClinic> loadedClinics =
      (data["results"] as List).map((vetJson) {
        return VetClinic.fromJson(vetJson);
      }).toList();

      if (!mounted) return;
      setState(() {
        vetClinic = loadedClinics;
        isLoading = false;
        errorMessage = loadedClinics.isEmpty
            ? 'No pet-friendly parks found in this area.'
            : null;
      });
    } on TimeoutException {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        errorMessage = 'The request took too long. Please try again.';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  Widget clinicTile(VetClinic data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VetsMaps(
              vetClinic: data,
              latLong: currentLatLng,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 0.03.sh),
        width: 0.9.sw,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffFF8B6A),
                  ),
                ),
                SizedBox(height: 0.008.sh),
                Text(
                  data.address,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 0.005.sh),
                Text(
                  data.timing ? "Currently Open" : "Currently Closed",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: data.timing ? Colors.greenAccent : Colors.redAccent,
                  ),
                ),
                SizedBox(height: 0.005.sh),
                RatingBar.builder(
                  initialRating: data.rating,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemSize: 0.03.sh,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                  ignoreGestures: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> apisChanger() async {
    setState(() {
      isLoading = true;
    });

    if (dropdownvalue == apis[0]) {
      apiChanger = 2500;
    } else if (dropdownvalue == apis[1]) {
      apiChanger = 5000;
    } else if (dropdownvalue == apis[2]) {
      apiChanger = 10000;
    }

    await getTotalData();
  }

  Widget _buildBody() {
    if (isLoading) {
      return SizedBox(
        width: 1.sw,
        height: 0.7.sh,
        child: Center(
          child: SizedBox(
            height: 15.sp,
            width: 15.sp,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              color: Color(0xffFF8B6A),
            ),
          ),
        ),
      );
    }

    if (errorMessage != null) {
      return SizedBox(
        width: 1.sw,
        height: 0.6.sh,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  errorMessage!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF8B6A),
                  ),
                  onPressed: getTotalData,
                  child: const Text(
                    'Try Again',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vetClinic.length,
      itemBuilder: (context, index) {
        return clinicTile(vetClinic[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0.sp, top: 15.sp),
                    child: Text(
                      'Best Pet Parks Near Me',
                      style: TextStyle(
                        color: const Color(0xffFF8B6A),
                        fontSize: 0.04.sw,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0.017.sh, left: 0.01.sw),
                    height: 0.05.sh,
                    child: DropdownButton<String>(
                      value: dropdownvalue,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: apis.map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(fontSize: 0.04.sw),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue == null) return;
                        setState(() {
                          dropdownvalue = newValue;
                        });
                        apisChanger();
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffFF8B6A),
                indent: 15,
                endIndent: 10,
              ),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }
}