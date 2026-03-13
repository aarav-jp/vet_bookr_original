import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/oScreens/petBoarding_page.dart';
import 'package:vet_bookr/oScreens/petCafes_page.dart';
import 'package:vet_bookr/oScreens/petGrooming_page.dart';
import 'package:vet_bookr/oScreens/petParks_page.dart';
import 'package:vet_bookr/oScreens/petResorts_page.dart';
import 'package:vet_bookr/oScreens/petRestaurants_page.dart';
import 'package:vet_bookr/oScreens/petTrainers_page.dart';

class PetSocialFilterTest extends StatelessWidget {
  const PetSocialFilterTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 0.03.sp),
            child: Text(
              'Find more fun for your pet',
              style: TextStyle(
                color: const Color(0xffFF8B6A),
                fontSize: 20.sp,
              ),
            ),
          ),

          const Divider(
            thickness: 2,
            color: Color(0xffFF8B6A),
            endIndent: 65,
            indent: 70,
          ),
          SizedBox(
            height: 15.sp,
          ),

          /// GRID
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 0.005.sh,
              crossAxisSpacing: 5.w,
              childAspectRatio: 1.2,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              children: [
                /// Resorts
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetResortsPage()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: Image.asset(
                        "assets/vacations.png",
                        width: 0.25.sw,
                        height: 0.225.sw,
                      ),
                    ),
                    SizedBox(height: 0.01.sh),
                    Text(
                      "Resorts",
                      style: TextStyle(
                          fontSize: 16.sp, fontFamily: "Vintage Style"),
                    ),
                  ],
                ),

                /// Cafes
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetCafesPage()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: Image.asset(
                        "assets/cafes.png",
                        width: 0.25.sw,
                        height: 0.225.sw,
                      ),
                    ),
                    SizedBox(height: 0.01.sh),
                    Text(
                      "Cafes",
                      style: TextStyle(
                          fontSize: 16.sp, fontFamily: "Vintage Style"),
                    ),
                  ],
                ),

                /// Restaurants
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetRestaurantsPage()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: Image.asset(
                        "assets/restaurants.png",
                        width: 0.25.sw,
                        height: 0.225.sw,
                      ),
                    ),
                    SizedBox(height: 0.01.sh),
                    Text(
                      "Restaurants",
                      style: TextStyle(
                          fontSize: 16.sp, fontFamily: "Vintage Style"),
                    ),
                  ],
                ),

                /// Trainers
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetTrainersPage()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: Image.asset(
                        "assets/trainers.png",
                        width: 0.25.sw,
                        height: 0.225.sw,
                      ),
                    ),
                    SizedBox(height: 0.01.sh),
                    Text(
                      "Trainers",
                      style: TextStyle(
                          fontSize: 16.sp, fontFamily: "Vintage Style"),
                    ),
                  ],
                ),

                /// Boarding
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetBoardersPage()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: Image.asset(
                        "assets/boarding.png",
                        width: 0.25.sw,
                        height: 0.225.sw,
                      ),
                    ),
                    SizedBox(height: 0.01.sh),
                    Text(
                      "Boarding",
                      style: TextStyle(
                          fontSize: 16.sp, fontFamily: "Vintage Style"),
                    ),
                  ],
                ),

                /// Grooming
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetGroomersPage()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: Image.asset(
                        "assets/grooming.png",
                        width: 0.25.sw,
                        height: 0.225.sw,
                      ),
                    ),
                    SizedBox(height: 0.01.sh),
                    Text(
                      "Grooming",
                      style: TextStyle(
                          fontSize: 16.sp, fontFamily: "Vintage Style"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// PARKS BUTTON
          Padding(
            padding: EdgeInsets.only(bottom: 100.sp),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PetParksPage()));
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffFAEEE2)),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                  child: Image.asset(
                    "assets/parks.png",
                    width: 0.25.sw,
                    height: 0.15.sw,
                  ),
                ),
                SizedBox(height: 0.01.sh),
                Text(
                  "Parks",
                  style:
                      TextStyle(fontSize: 16.sp, fontFamily: "Vintage Style"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
