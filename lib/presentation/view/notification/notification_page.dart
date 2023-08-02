import 'package:digital_sleek/presentation/common/notification_card_widget.dart';
import 'package:digital_sleek/presentation/common/search_widget.dart';
import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/view/home/model.dart';
import 'package:digital_sleek/presentation/view/home/path.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    // double textScaling = MediaQuery.of(context).textScaleFactor;
    List<HomeModel> homeTopNewsList = HomeModel.topNews;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(
              titleFontSize:  context.textScaling <= 1.0 ? context.textScaling * 16 : 12, //16,
              prefixIcon: 'assets/icons/ic_arrow.svg',
              centerTitle: 'Notifications',
              appBarcolor: appBarColor,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavigationBarScreen(
                              value: 0,
                            )));
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Today",
                style: TextStyle(
                  fontSize: context.textScaling <= 1.0 ? context.textScaling * 20 : 14, //18

                  fontFamily: payfairSemiBold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                clipBehavior: Clip.none,
                itemBuilder: ((context, index) {
                  return const NotificationCardWidget();
                }),
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 3,
              ),
            ),

            ///
            // Padding(
            //   padding: const EdgeInsets.only(left: 24),
            //   child: Text(
            //     "Today",
            //     style: TextStyle(
            //       fontSize: textScaling <= 1.0 ? textScaling * 20 : 14, //18

            //       fontFamily: payfairSemiBold,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // Expanded(
            //   child: ListView.separated(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     clipBehavior: Clip.none,
            //     itemBuilder: ((context, index) {
            //       return const NotificationCardWidget();
            //     }),
            //     separatorBuilder: (_, index) {
            //       return const SizedBox(
            //         height: 10,
            //       );
            //     },
            //     itemCount: 3,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
