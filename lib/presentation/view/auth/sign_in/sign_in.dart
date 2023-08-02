import 'dart:developer';
import 'package:digital_sleek/presentation/common/button_widget.dart';
import 'package:digital_sleek/presentation/common/circular_progress_indicator_widget.dart';
import 'package:digital_sleek/presentation/common/signin_signup_bottom_text_widget.dart';
import 'package:digital_sleek/presentation/common/signin_signup_header_widget.dart';
import 'package:digital_sleek/presentation/common/snackBar_widget.dart';
import 'package:digital_sleek/presentation/common/textfield_widget.dart';
import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/text.dart';
import 'package:digital_sleek/presentation/view/auth/select_signin/select_sign.dart';
import 'package:digital_sleek/presentation/view/auth/sign_in/cubit/signin_cubit.dart';
import 'package:digital_sleek/presentation/view/auth/sign_up/sign_up.dart';
import 'package:digital_sleek/presentation/view/home/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  final String? userEmail;
  const SignInPage({super.key, this.userEmail = ''});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController.text = widget.userEmail.toString();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async {
    String email = emailController.text.trim().toString();
    String password = passwordController.text.trim().toString();
    var result = await context
        .read<SignInCubit>()
        .signInWithEmailAndPassword(email, password);
    log('SignIn Successful $result');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectSignScreen())),
                      child: SvgPicture.asset("assets/icons/ic_arrow.svg")),
                  const SizedBox(
                    height: 60,
                  ),
                  const SignInAndSignUpHeaderWidget(
                    title: welcomeBack,
                    subTitle: subTitleSignIn,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // TextFieldWidget(
                  //   controller: emailController,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter your email address';
                  //     }
                  //     if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //         .hasMatch(value)) {
                  //       return 'Please enter a valid email address';
                  //     }
                  //     return null;
                  //   },
                  //   hint: 'Email address',
                  //   svgIcon: 'assets/icons/ic_email_outline.svg',
                  // ),

                  CustomTextField(
                    controller: emailController,
                    hintText: 'Enter email',
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: 'assets/icons/ic_email_outline.svg',
                    isValid: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      }
                      if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    suffixIconIsVisible: true,
                    hintText: 'Enter password',
                    textInputType: TextInputType.text,
                    prefixIcon: 'assets/icons/ic_lock.svg',
                    isValid: true,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  // TextFieldWidget(
                  //   controller: passwordController,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter your password';
                  //     }
                  //     return null;
                  //   },
                  //   hint: 'Password',
                  //   svgIcon: 'assets/icons/ic_lock.svg',
                  // ),
                  const SizedBox(
                    height: 5,
                  ),

                  BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) {
                    if (state is SignInSuccess) {
                      SnackBarWidget.buildSnackBar(
                          context,
                          'SignIn successfully',
                          Colors.black,
                          Icons.check,
                          false);

                      /// when user first time signin then store reference to veriable
                      isSignIn();

                      ///
                      ///
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationBarScreen()));
                    } else if (state is SignInError) {
                      SnackBarWidget.buildSnackBar(
                          context,
                          '${state.errorMessage}',
                          Colors.black,
                          Icons.cancel_outlined,
                          false);
                      log('ABIDDD: ${state.props}');
                    }
                  }, builder: (context, state) {
                    if (state is SignInLoading) {
                      return const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: Center(
                            child: CircularProgressIndicatorWidget(),
                          ));
                    }
                    return ButtonWidget(
                      buttonColor: darkPrimaryColor,
                      centerTextColor: white,
                      centerTextButtonSize: 14,
                      notCenterText: false,
                      title: 'Login',
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                        // var login = await context.read<SignInCubit>().signInWithEmailAndPassword('abidk1889@gmail.com', '12345678');
                        // log('DDD: ${login}');
                      },
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  SignInSignUpBottomTextWidget(
                    title1: 'New member? ',
                    title2: 'Register',
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void isSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  // void get() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final myBool = prefs.getBool('isLoggedIn') ?? false;
  //   log('SHARED PRE: $myBool');
  // }
}
