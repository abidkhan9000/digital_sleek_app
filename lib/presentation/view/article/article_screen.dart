import 'package:digital_sleek/presentation/common/avatar_widget.dart';
import 'package:digital_sleek/presentation/common/card_widget.dart';
import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/resources/text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticalScreen extends StatefulWidget {
  const ArticalScreen(
      {super.key,
      this.newsTitle,
      this.topNewsImage,
      this.fullDes,
      this.userImage,
      this.name,
      this.newsDescription,
      this.onPress});
  final String? newsTitle;
  final String? topNewsImage;
  final String? newsDescription;
  final String? fullDes;
  final String? userImage;
  final String? name;
  final VoidCallback? onPress;

  @override
  State<ArticalScreen> createState() => _ArticalScreenState();
}

class _ArticalScreenState extends State<ArticalScreen> {
  @override
  Widget build(BuildContext context) {
    // double textScaling = MediaQuery.of(context).textScaleFactor;
    // height = MediaQuery.of(context).size.height;
    // width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.topNewsImage!,
                    child: ClipRRect(
                      // borderRadius: const BorderRadius.only(
                      //   bottomRight: Radius.circular(50),
                      //   bottomLeft: Radius.circular(50),
                      // ),
                      child: SizedBox(
                        height: 250, //height / 2.4
                        width: context.width,
                        child: Image.asset(
                          "${widget.topNewsImage}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: widget.onPress,
                          child: SvgPicture.asset(
                            "assets/icons/ic_arrow.svg",
                            color: white,
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/ic_bookmar_outline.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 240, //300 //2.5
                    child: Container(
                      width: context.width,
                      height: context.height,
                      decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AvatarWidget(
                          avatorImage: widget.userImage,
                          avatorName: widget.name,
                          avatorHeight: 39,
                          fontSize: 14,
                          spaceBetweenSize: context.width * 0.020,
                        ),
                        Text(
                          '12, March, 2022',
                          style: TextStyle(
                            fontFamily: intern,
                            fontSize:
                            context.textScaling <= 1.0 ? context.textScaling * 13 : 9, //11
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${widget.newsTitle}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: intern,
                          color: Color(0XFF414141)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.newsDescription}',
                      style: TextStyle(
                        fontSize:
                        context.textScaling < 1.0 ? context.textScaling * 16 : 18, //16
                        fontFamily: interSemiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      newsDetail,
                      style: TextStyle(
                        fontFamily: intern,
                        fontSize:
                        context.textScaling < 1.0 ? context.textScaling * 10 : 14, //12
                      ),
                      strutStyle: const StrutStyle(
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Related Articles',
                      style: TextStyle(
                        fontFamily: payfairSemiBold,
                        fontSize: context.textScaling < 1.0 ? 14 : 20, //16
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: context.width, //335
                      // color: Colors.green,
                      child: ListView.separated(
                        clipBehavior: Clip.none,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return const CardWidget();
                        },
                        itemCount: 3,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: darkPrimaryColor,
          child: const Icon(
            Icons.share,
          ),
        ),
      ),
    );
  }
}
