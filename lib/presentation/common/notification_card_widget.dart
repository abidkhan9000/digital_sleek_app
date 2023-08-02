import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/view/home/model.dart';
import 'package:flutter/material.dart';

class NotificationCardWidget extends StatefulWidget {
  const NotificationCardWidget({super.key});

  @override
  State<NotificationCardWidget> createState() => _NotificationCardWidgetState();
}

class _NotificationCardWidgetState extends State<NotificationCardWidget> {
  @override
  Widget build(BuildContext context) {
    List<HomeModel> homeTopNewsList = HomeModel.topNews;

    return Container(
      height: 70, //115
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
            margin: const EdgeInsets.only(left: 10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              // color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:

                  // Image.asset(
                  //   "assets/images/car.png",
                  //   width: 30,
                  //   height: 30,
                  // ),

                  Image.network(
                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
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
                  height: context.height * 0.016,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New login',
                      style: TextStyle(
                        fontSize:
                        context.textScaling <= 1.0 ? context.textScaling * 16 : 7, //10
                        fontFamily: intern,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text('12:34 AM',
                          style: TextStyle(
                            fontSize:
                            context.textScaling <= 1.0 ? context.textScaling * 11 : 7, //10
                            fontFamily: intern,
                            color: const Color(0XFF414141),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.005,
                ),
                SizedBox(
                  // margin: const EdgeInsets.only(right: 5),
                  child: Text(
                    'New login  has been in the app',
                    style: TextStyle(
                      fontSize: context.textScaling <= 1.0 ? context.textScaling * 12 : 9, //13
                      fontFamily: intern,
                      color: const Color(0XFF414141),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
