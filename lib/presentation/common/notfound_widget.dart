import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget(
      {super.key,
      this.svg,
      this.text1,
      this.text2,
      this.buttonTextColor,
      this.buttonText,
      this.buttonBgColor,
      this.buttonTextSize,
      this.buttonTextOpacity});

  final Color? buttonTextColor, buttonBgColor;
  final String? text1, text2, buttonText;
  final double? buttonTextSize, buttonTextOpacity;
  final String? svg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          svg != null
              ? SvgPicture.asset(
                  '$svg',
                )
              : Container(),
          const SizedBox(
            height: 10,
          ),
          Text(
            '$text1',
            style: const TextStyle(
              fontSize: 18,
              color: darkPrimaryColor,
              fontFamily: interSemiBold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '$text2',
            style: const TextStyle(
              fontSize: 11,
              fontFamily: intern,
            ),
          ),
          // ButtonWidget(
          //   title: buttonText,
          //   buttonColor: buttonBgColor,
          //   centerTextButtonSize: buttonTextSize,
          //   centerTextColor: buttonTextColor,
          //   centerTextOpacityButton: buttonTextOpacity,
          //   notCenterText: false,
          //   onPress: () {},
          // ),
        ],
      ),
    );
  }
}
