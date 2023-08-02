import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:flutter/material.dart';

class SignInSignUpBottomTextWidget extends StatefulWidget {
  const SignInSignUpBottomTextWidget(
      {super.key, this.title1, this.title2, this.onPress});
  final String? title1;
  final String? title2;
  final VoidCallback? onPress;

  @override
  State<SignInSignUpBottomTextWidget> createState() =>
      _SignInSignUpBottomTextWidgetState();
}

class _SignInSignUpBottomTextWidgetState
    extends State<SignInSignUpBottomTextWidget> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.title1}',
              style: TextStyle(
                fontSize: context.textScaling <= 1.0 ? context.textScaling * 14 : 13, //14
                fontFamily: intern,
              ),
            ),
            GestureDetector(
              onTap: widget.onPress,
              child: Text(
                '${widget.title2}',
                style: TextStyle(
                    fontSize: context.textScaling <= 1.0 ? context.textScaling * 14 : 13, //14
                    fontFamily: interSemiBold,
                    color: darkPrimaryColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
