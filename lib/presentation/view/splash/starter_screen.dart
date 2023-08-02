import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_sleek/presentation/common/button_widget.dart';
import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/resources/text.dart';
import 'package:digital_sleek/presentation/view/auth/select_signin/select_sign.dart';
import 'package:digital_sleek/presentation/view/splash/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<SplashModel> _data = SplashModel.data;
  final bool? isArrow = true;
  final CarouselController _controller1 = CarouselController();

  late PageController _pageController;
  int _activeIndex = 0;
  int index = 0;
  int _current = 0;

  @override
  void initState() {
    // _controller1 = CarouselController();
    _pageController = PageController();

    super.initState();

    _pageController = PageController(viewportFraction: 1);
    _pageController.addListener(() {
      if (_activeIndex != _pageController.page!.round()) {
        _activeIndex = _pageController.page!.round();
      }
      setState(() {});
    });
    // CarouselController().nextPage();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double textScaling = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      _controller1.previousPage();
                    });
                  },
                  child: _current > 0
                      ? SvgPicture.asset(
                          "assets/icons/ic_arrow.svg",
                        )
                      : SvgPicture.asset(
                          "assets/icons/ic_arrow.svg",
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  '${_data[_current].title}',
                  style: TextStyle(
                    fontSize: context.textScaling <= 1.0 ? context.textScaling * 24 : 18, //24
                    fontWeight: FontWeight.w700,
                    fontFamily: payfairBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: context.width / 1.3,
                  // color: Colors.grey,
                  height: context.height * 0.08,
                  child: Text(
                    '${_data[_current].desc}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: intern,
                      fontSize:
                          context.textScaling <= 1.0 ? context.textScaling * 14 : 12, //16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  CarouselSlider(
                      carouselController: _controller1,
                      items: <Widget>[
                        for (int i = 0; i < _data.length; i++)
                          Image.asset(
                            _data[i].imagePath!,
                            fit: BoxFit.cover,
                          ),
                      ],
                      options: CarouselOptions(
                        // enlargeCenterPage: true,
                        viewportFraction: 0.70, //69
                        // reverse: false,
                        aspectRatio: 16 / 16,
                        // height: 400,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      )),
                  // AnimatedSmoothIndicator(
                  //   activeIndex: _current,
                  //   count: 3,
                  //   effect: CustomizableEffect(
                  //     spacing: 10.0,
                  //     dotDecoration: DotDecoration(
                  //       width: 10,
                  //       height: 10,
                  //       color: Colors.grey,
                  //       // rotationAngle: 90,
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     activeDotDecoration: DotDecoration(
                  //       width: 15,
                  //       height: 15,
                  //       color: darkPrimaryColor,
                  //       // rotationAngle: 90,
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _data.length; i++)
                    Container(
                      height: _current == i ? 15 : 8,
                      width: _current == i ? 15 : 8,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: _current == i ? darkPrimaryColor : Colors.grey,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          // BoxShadow(
                          //   color: Colors.grey,
                          //   spreadRadius: 1,
                          //   blurRadius: 3,
                          //   offset: Offset(2, 2),
                          // )
                        ],
                      ),
                    )
                ],
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ButtonWidget(
                    title: _current == 2 ? started : next,
                    buttonColor: darkPrimaryColor,
                    centerTextButtonSize: 14.0,
                    notCenterText: false,
                    centerTextColor: Colors.white,
                    onPress: () {
                      _controller1.nextPage();
                      if (_current == 2) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectSignScreen()));
                      }
                      log('_current: $_current');
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
