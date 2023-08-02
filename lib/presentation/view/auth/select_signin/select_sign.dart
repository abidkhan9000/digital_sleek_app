import 'dart:developer';

import 'package:digital_sleek/presentation/common/button_widget.dart';
import 'package:digital_sleek/presentation/common/circular_progress_indicator_widget.dart';
import 'package:digital_sleek/presentation/common/snackbar_widget.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/resources/text.dart';
import 'package:digital_sleek/presentation/view/auth/select_signin/cubit/google_auth_cubit.dart';
import 'package:digital_sleek/presentation/view/auth/sign_up/sign_up.dart';
import 'package:digital_sleek/presentation/view/home/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectSignScreen extends StatefulWidget {
  const SelectSignScreen({super.key});

  @override
  State<SelectSignScreen> createState() => _SelectSignScreenState();
}

class _SelectSignScreenState extends State<SelectSignScreen> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double textScaling = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: const Color(0XFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      isGuest();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationBarScreen(
                                    isGuest: true,
                                  )),
                          (route) => false);
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const BottomNavigationBarScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 24.0),
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        color: Color(0XFFCACACA),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/ic_cross.svg',
                        width: 10,
                        height: 10,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 57),
                // color: Colors.green,
                child: Center(
                  child: Image.asset(
                    'assets/images/splash_logo.png',
                    fit: BoxFit.cover,
                    // width: 150,
                    height: 170,
                    //width: double.infinity,
                    //height: MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
                    listener: (context, state) {
                      if (state is GoogleAuthSucssessState) {
                        log('Google Authentication Successfully...');
                        SnackBarWidget.buildSnackBar(
                          context,
                          'Google Authentication Successfully',
                          Colors.black,
                          Icons.check,
                          false,
                        );
                        isSignIn();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationBarScreen(
                                      value: 0,
                                    )));
                      } else if (state is GoogleAuthErrorState) {
                        log("Google Authentication Error: ${state.error.toString()}");
                        SnackBarWidget.buildSnackBar(
                          context,
                          'Error ${state.error.toString()}',
                          Colors.black,
                          Icons.check,
                          false,
                        );
                      }
                    },
                    builder: (BuildContext context, state) {
                      if (state is GoogleAuthLoadingState) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: Center(
                            child: CircularProgressIndicatorWidget(),
                          ),
                        );
                      }
                      // if (state is GoogleAuthInitialState) {
                      //   return ButtonWidget(
                      //     svg: "assets/icons/ic_google.svg",
                      //     title: loginGoogle,
                      //     buttonColor: Colors.white,
                      //     onPress: () async {
                      //       await context.read<GoogleAuthCubit>().googleAuth();
                      //     },
                      //   );
                      // }
                      return ButtonWidget(
                        svg: "assets/icons/ic_google.svg",
                        title: loginGoogle,
                        buttonColor: Colors.white,
                        onPress: () async {
                          await context.read<GoogleAuthCubit>().googleAuth();
                        },
                      );
                    },
                  ),
                  ButtonWidget(
                    svg: "assets/icons/ic_facebook.svg",
                    // icon: FontAwesomeIcons.facebook,
                    title: loginFacebook,
                    buttonColor: Colors.white,
                    onPress: () {},
                  ),
                  ButtonWidget(
                    svg: "assets/icons/ic_email.svg",
                    // icon: FontAwesomeIcons.apple,
                    title: loginApple,
                    iconColor: Colors.black,
                    buttonColor: Colors.white,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  footerLogin,
                  style: TextStyle(
                    height: 1.5,
                    fontFamily: intern,
                    fontSize: context.textScaling <= 1.0
                        ? context.textScaling * 12
                        : 8, //12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void isSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  void isGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isGuestIn', true);
    log("Guest In");
  }
}
