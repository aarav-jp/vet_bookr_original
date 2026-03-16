import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vet_bookr/oScreens/list_pet.dart';
import 'package:vet_bookr/oScreens/pharma_Loading.dart';
import 'package:vet_bookr/oScreens/social_loading.dart';
import 'package:vet_bookr/oScreens/testing/pet_gpt_screen.dart';
import 'package:vet_bookr/oScreens/welcome_screen.dart';

import 'clinicsloading.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isLoading = false;
  var count = 0;

  void checkLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListPets(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: Container(),
        toolbarHeight: 0.07.sh,
        centerTitle: true,
        title: Image.asset(
          "assets/logo.png",
          height: 0.13.sh,
          width: 0.47.sw,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/menu_background.png"),
              fit: BoxFit.cover),
        ),
        child: isLoading
            ? SizedBox(
                height: 2.sp,
                width: 2.sp,
                child: CircularProgressIndicator(
                  color: Color(0xffFF8B6A),
                  strokeWidth: 2.sp,
                ),
              )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 0.1.sh),
                    width: 1.sw,
                    margin: EdgeInsets.only(
                      top: 0.038.sh,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            checkLogin();
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.sp)),
                            child: Container(
                              padding: EdgeInsets.only(top: 0.02.sh),
                              height: 0.2.sh,
                              width: 0.39.sw,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      checkLogin();
                                    },
                                    style: ButtonStyle(
                                      elevation: WidgetStateProperty.all(0),
                                      backgroundColor: WidgetStateProperty.all(
                                          Colors.transparent),
                                      shape: WidgetStateProperty.all(
                                        CircleBorder(),
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/My_Pet_Profile.png",
                                      width: 0.27.sw,
                                      height: 0.27.sw,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.01.sh,
                                  ),
                                  Text(
                                    "My Pets",
                                    style: TextStyle(
                                        fontSize: 16.5.sp,
                                        fontFamily: "Vintage Style",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SplashScreen(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.sp)),
                            child: Container(
                              padding: EdgeInsets.only(top: 0.02.sh),
                              height: 0.2.sh,
                              width: 0.39.sw,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SplashScreen(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      elevation: WidgetStateProperty.all(0),
                                      backgroundColor: WidgetStateProperty.all(
                                          Colors.transparent),
                                      shape: WidgetStateProperty.all(
                                        CircleBorder(),
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/Find_a_Pet.png",
                                      width: 0.27.sw,
                                      height: 0.27.sw,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.01.sh,
                                  ),
                                  Text(
                                    "Find a Vet",
                                    style: TextStyle(
                                        fontSize: 16.5.sp,
                                        fontFamily: "Vintage Style",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    margin: EdgeInsets.only(
                      top: 0.02.sh,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PharmaLoading(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.sp)),
                            child: Container(
                              padding: EdgeInsets.only(top: 0.02.sh),
                              height: 0.2.sh,
                              width: 0.39.sw,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PharmaLoading(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      elevation: WidgetStateProperty.all(0),
                                      backgroundColor: WidgetStateProperty.all(
                                        Colors.transparent,
                                      ),
                                      shape: WidgetStateProperty.all(
                                        CircleBorder(),
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/Find_A_Pet_Pharmacy.png",
                                      width: 0.27.sw,
                                      height: 0.23.sw,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.01.sh,
                                  ),
                                  Text(
                                    "Find a Pet \nPharmacy",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "Vintage Style",
                                        height: 0.85.sp,
                                        fontWeight: FontWeight.bold),
                                  ),]
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SocialLoading(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.sp)),
                            child: Container(
                              padding: EdgeInsets.only(top: 0.01.sh, right: 0.05.sw),
                              height: 0.2.sh,
                              width: 0.39.sw,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SocialLoading(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      elevation: WidgetStateProperty.all(0),
                                      backgroundColor: WidgetStateProperty.all(
                                        Colors.transparent,
                                      ),
                                      shape: WidgetStateProperty.all(
                                        CircleBorder(),
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/Pet_Social.png",
                                      fit: BoxFit.contain,
                                      width: 0.3.sw,
                                      height: 0.24.sw,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.01.sh,
                                  ),
                                  Text(
                                    "Pet Social",
                                    style: TextStyle(
                                        fontSize: 16.5.sp,
                                        fontFamily: "Vintage Style",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetGPTScreen(),
                        ),
                      );
                    },
                    child: Container(

                      // width: 1.sw,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.sp)),
                        color: Color(0xff277568),
                        child: Container(
                          height: 0.13.sh,
                          child: Row(
                            children: [

                              Padding(
                                padding: EdgeInsets.only(left: 0.023.sw, right: 0.02.sw),
                                child: Image.asset(
                                  "assets/PetGPT_Icon.png",
                                  fit: BoxFit.contain,
                                  width: 0.29.sw,
                                  height: 0.24.sw,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "PetGPT",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.5.sp,
                                      fontFamily: "Vintage Style",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 0.02.sw),
                                    child: Text(
                                      "Get instant pet care advice",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontFamily: "Vintage Style",
                                        overflow: TextOverflow.visible
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
            ),
      ),
    );
  }
}
