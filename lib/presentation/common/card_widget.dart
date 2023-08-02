import 'package:digital_sleek/presentation/common/avatar_widget.dart';
import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/view/home/model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, this.serach});
  final String? serach;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    List<HomeModel> homeTopNewsList = HomeModel.topNews;
    // double textScaling = MediaQuery.of(context).textScaleFactor;

    return Container(
      height: context.height * 0.133, //115
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            // color: const Color(0xff0000000d).withOpacity(0.05),
            blurRadius: 25,
            offset: Offset(0, 20),
            spreadRadius: -20,
            // blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            width: context.width * 0.22, //96
            height: context.height * 0.110, //96
            decoration: BoxDecoration(
              // color: Colors.green,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child:
                  // Image.asset(
                  //   "assets/images/car.png",
                  //   width: 30,
                  //   height: 30,
                  // ),

                  Image.network(
                "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1283&q=80",
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          backgroundColor: white,
                          color: darkPrimaryColor,
                        )),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: context.width * 0.030,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height * 0.014,
                ),
                Text(
                  'AUTO',
                  style: TextStyle(
                    fontSize: context.textScaling <= 1.0 ? context.textScaling * 10 : 7, //10
                    fontFamily: intern,
                    color: const Color(0XFF414141),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.005,
                ),
                SizedBox(
                  // margin: const EdgeInsets.only(right: 5),
                  child: Text(
                    'Mercedes-Benz EQS 580 launched in India, know price and features.',
                    style: TextStyle(
                      fontSize: context.textScaling <= 1.0 ? context.textScaling * 13 : 9, //13
                      fontFamily: interSemiBold,
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.008),
                AvatarWidget(
                  avatorImage: homeTopNewsList[0].topNewsAvator,
                  avatorName: homeTopNewsList[0].topName,
                  color: const Color(0XFF414141),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
