import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/text.dart';
import 'package:digital_sleek/presentation/view/home/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigationBarScreen(
                                value: 3,
                              )));
                },
                child: SizedBox(
                  child: SvgPicture.asset(
                    'assets/icons/ic_arrow.svg',
                    height: 15,
                    width: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 18, fontFamily: interSemiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                privacyPolicyDes,
                style: TextStyle(fontSize: 14, fontFamily: intern),
                strutStyle: StrutStyle(
                  height: 1.7,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Personal Data:',
                style: TextStyle(fontSize: 16, fontFamily: interSemiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                privacyPolicyDes,
                style: TextStyle(fontSize: 14, fontFamily: intern),
                strutStyle: StrutStyle(
                  height: 1.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
