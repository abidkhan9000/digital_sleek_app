import 'dart:developer';

import 'package:digital_sleek/data/services/auth/google_auth_service.dart';
import 'package:digital_sleek/data/services/auth/signin_service.dart';
import 'package:digital_sleek/data/services/auth/signup_service.dart';
import 'package:digital_sleek/data/services/home_service.dart';
import 'package:digital_sleek/firebase_options.dart';
import 'package:digital_sleek/presentation/view/auth/select_signin/cubit/google_auth_cubit.dart';
import 'package:digital_sleek/presentation/view/auth/sign_in/cubit/signin_cubit.dart';
import 'package:digital_sleek/presentation/view/auth/sign_up/cubit/sigup_cubit.dart';
import 'package:digital_sleek/presentation/view/home/cubit/home_cubit.dart';
import 'package:digital_sleek/presentation/view/home/path.dart';
import 'package:digital_sleek/presentation/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    log('SHARED PRE is Login: $isLoggedIn');
    return isLoggedIn;
  }

  Future<bool> getGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isGuestIn') ?? false;
    return isLoggedIn;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(signUpService: SignUpService()),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(signInService: SignInService()),
        ),
        BlocProvider<GoogleAuthCubit>(
          create: (context) =>
              GoogleAuthCubit(googleAuthService: GoogleAuthService()),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(homeService: HomeService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: get(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return FutureBuilder(
                future: getGuest(),
                builder: (context, AsyncSnapshot<bool> guestSnapshot) {
                  if (guestSnapshot.hasData) {
                    log('Guest In: ${guestSnapshot.data}');
                    return snapshot.data! || guestSnapshot.data!
                        ? BottomNavigationBarScreen(
                            value: 0,
                            isGuest: guestSnapshot.data,
                          )
                        : const SplashScreen();
                  }
                  return const CircularProgressIndicator();
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
