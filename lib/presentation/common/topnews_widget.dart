import 'dart:developer';

import 'package:digital_sleek/presentation/common/avatar_widget.dart';
import 'package:digital_sleek/presentation/common/category_container_widget.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/view/article/article_screen.dart';
import 'package:flutter/material.dart';

class TopNewsWidget extends StatefulWidget {
  const TopNewsWidget(
      {super.key,
      this.topNewsTitle,
      this.topNewsDescription,
      this.topNewsAvatorImage,
      this.topName,
      this.topNewsImage,
      this.onPress});

  final String? topNewsTitle;
  final String? topNewsDescription;
  final String? topName;
  final String? topNewsImage;
  final String? topNewsAvatorImage;
  final VoidCallback? onPress;

  @override
  State<TopNewsWidget> createState() => _TopNewsWidgetState();
}

class _TopNewsWidgetState extends State<TopNewsWidget> {
  bool isLoading = true;
  ImageChunkEvent? imageLoading;

  loadHome() {
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isLoading = false;
      });
    });
    setState(() {
      imageLoading = null;
    });
  }

  @override
  Widget build(BuildContext context) {

    // log('TEXT SCALING: ${context.textScaling}');
    log('HEIGTH SCALING: ${context.height}');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticalScreen(
                        topNewsImage: widget.topNewsImage,
                        newsTitle: widget.topNewsTitle,
                        userImage: widget.topNewsAvatorImage,
                        name: widget.topName,
                        newsDescription: widget.topNewsDescription,
                        onPress: widget.onPress,
                      )));
        },
        child: Hero(
          tag: widget.topNewsImage!,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              // margin: const EdgeInsets.symmetric(horizontal: 1),
              width: context.width * 0.80, //330
              height: context.height * 0.27, //33
              decoration: BoxDecoration(
                // color: Colors.green,
                borderRadius: BorderRadius.circular(18.0), //
                image: DecorationImage(
                  image: FadeInImage(
                    placeholder: AssetImage(
                      '${widget.topNewsImage}',
                    ),
                    image: AssetImage(
                      '${widget.topNewsImage}',
                    ),
                  ).image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // top: height * 0.15, // 130
                    child: Container(
                      width: context.width - 80,
                      height: context.height * 0.27, //33
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(15.0), //
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.0),
                            Colors.black.withOpacity(0.90),
                            // const Color(0xff000000).withOpacity(0.2),
                            // const Color(0xff000000).withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: context.height * 0.010, //12
                    left: context.width * 0.026, //12
                    child: CategoryContainerWidget(
                        topNewsTitle: widget.topNewsTitle),
                  ),
                  Positioned(
                    top: context.height * 0.135, //160
                    right: context.width * 0.035, //17
                    left: context.width * 0.028, //12
                    child: SizedBox(
                      // color: Colors.grey,
                      // decoration: BoxDecoration(
                      //   gradient: LinearGradient(
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter,
                      //     colors: [
                      //       Colors.black,
                      //       Colors.black26,
                      //     ],
                      //   ),
                      // ),
                      // width: width - 17,
                      child: Text(
                        '${widget.topNewsDescription}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                          context.textScaling <= 1.0 ? context.textScaling * 15 : 10, //14
                          fontFamily: interSemiBold,
                        ),
                        strutStyle: const StrutStyle(
                          height: 1.45,
                        ),
                      ), //50
                    ),
                  ),
                  Positioned(
                    top: context.height * 0.217,
                    left: 12,
                    child: AvatarWidget(
                      avatorName: widget.topName,
                      avatorImage: widget.topNewsAvatorImage,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
