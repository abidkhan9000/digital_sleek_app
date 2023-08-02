import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:flutter/material.dart';

class SignInAndSignUpHeaderWidget extends StatefulWidget {
  const SignInAndSignUpHeaderWidget({super.key, this.title, this.subTitle});
  final String? title;
  final String? subTitle;

  @override
  State<SignInAndSignUpHeaderWidget> createState() =>
      _SignInAndSignUpHeaderWidgetState();
}

class _SignInAndSignUpHeaderWidgetState
    extends State<SignInAndSignUpHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    // double textScaling = MediaQuery.of(context).textScaleFactor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            'assets/images/splash_logo.png',
            // width: context.width / 2.0,
            height: 170,
            fit: BoxFit.cover,
            //height: MediaQuery.of(context).size.height,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.title ?? '',
          style: TextStyle(
            fontSize: context.textScaling <= 1.0 ? context.textScaling * 20 : 18, //20
            fontFamily: interSemiBold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.subTitle ?? '',
          style: TextStyle(
            fontSize: context.textScaling <= 1.0 ? context.textScaling * 12 : 13, //12
            fontFamily: intern,
            color: const Color(0XFF01303F),
          ),
        ),
      ],
    );
  }
}
