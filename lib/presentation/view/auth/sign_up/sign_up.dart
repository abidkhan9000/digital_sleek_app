import 'dart:developer';

import 'package:digital_sleek/presentation/common/button_widget.dart';
import 'package:digital_sleek/presentation/common/circular_progress_indicator_widget.dart';
import 'package:digital_sleek/presentation/common/signin_signup_bottom_text_widget.dart';
import 'package:digital_sleek/presentation/common/signin_signup_header_widget.dart';
import 'package:digital_sleek/presentation/common/snackbar_widget.dart';
import 'package:digital_sleek/presentation/common/textfield_widget.dart';
import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/text.dart';
import 'package:digital_sleek/presentation/view/auth/select_signin/select_sign.dart';
import 'package:digital_sleek/presentation/view/auth/sign_in/sign_in.dart';
import 'package:digital_sleek/presentation/view/auth/sign_up/cubit/sigup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() async {
    String email = emailController.text.trim().toString();
    String password = passwordController.text.trim().toString();
    String userName = nameController.text.trim().toString();

    await context.read<SignUpCubit>().signUp(email, password, userName);
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
                    title: welcome,
                    subTitle: subTitleSignUp,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: nameController,
                    textInputType: TextInputType.text,
                    hintText: 'Full name',
                    prefixIcon: 'assets/icons/ic_person.svg',
                    isValid: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email address',
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
                    hintText: 'Password',
                    prefixIcon: 'assets/icons/ic_lock.svg',
                    textInputType: TextInputType.text,
                    isValid: true,
                    obscureText: true,
                    suffixIconIsVisible: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    // onChange: (value) {
                    //   // log('Value: $passwordController');
                    // },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                    if (state is LoadingState) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Center(
                          child: CircularProgressIndicatorWidget(),
                        ),
                      );
                    }
                    // SignUpModel(
                    //   name: nameController.text,
                    //   email: emailController.text,
                    //   password: passwordController.text,
                    // );
                    if (state is InitialState) {
                      return ButtonWidget(
                        buttonColor: darkPrimaryColor,
                        centerTextColor: white,
                        centerTextButtonSize: 14,
                        notCenterText: false,
                        title: 'Register',
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            register();
                          }

                          // var d = await context.read<SignUpCubit>().signUp(emailController.text, passwordController.text);
                          // log('Create User: $d');
                        },
                      );
                    }
                    return ButtonWidget(
                      buttonColor: darkPrimaryColor,
                      centerTextColor: white,
                      centerTextButtonSize: 14,
                      notCenterText: false,
                      title: 'Register',
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          register();
                        }

                        // var d = await context.read<SignUpCubit>().signUp(emailController.text, passwordController.text);
                        // log('Create User: $d');
                      },
                    );
                  }, listener: (context, state) {
                    if (state is AuthenticatedState) {
                      SnackBarWidget.buildSnackBar(
                          context,
                          'SignUp successfully',
                          Colors.black,
                          Icons.check,
                          false);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage(
                                    userEmail: emailController.text,
                                  )));
                    } else if (state is ErrorState) {
                      SnackBarWidget.buildSnackBar(context, '${state.error}',
                          Colors.black, Icons.cancel_outlined, false);
                      log('ABIDDD: ${state.error}');
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  SignInSignUpBottomTextWidget(
                    title1: 'Already member? ',
                    title2: 'Login',
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // snackBar() {
  //   final snackBar = SnackBar(
  //     /// need to set following properties for best effect of awesome_snackbar_content
  //     elevation: 0,
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     content: AwesomeSnackbarContent(
  //       title: 'Success!',
  //       message: 'your registration is successfully',

  //       /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
  //       contentType: ContentType.success,
  //     ),
  //   );

  //   ScaffoldMessenger.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }

  // signUp(String email, String password) async {
  //
  //   try {
  //       await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: email.toString(),
  //       password: password.toString(),
  //     );
  //     // FirebaseUser user = result.user;
  //     // print("user created: $user");
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}
