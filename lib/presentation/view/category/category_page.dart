import 'package:digital_sleek/presentation/common/card_widget.dart';
import 'package:digital_sleek/presentation/common/search_widget.dart';
import 'package:digital_sleek/presentation/common/topnews_widget.dart';
import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/view/home/model.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, this.categoryTitle});
  final String? categoryTitle;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {

    List<HomeModel> homeTopNewsList = HomeModel.topNews;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(
                prefixIcon: 'assets/icons/ic_arrow.svg',
                centerTitle: widget.categoryTitle,
                appBarcolor: appBarColor,
                titleFontSize:  context.textScaling <= 1.0 ? context.textScaling * 16 : 12, //16,
                onPress: () {
                  Navigator.pop(context);
                  // Navigator.pop(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const CategoryPage()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "Recent News",
                  style: TextStyle(
                    fontSize: context.textScaling <= 1.0 ? context.textScaling * 20 : 14, //18

                    fontFamily: payfairSemiBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: context.width, //350
                height: context.height * 0.27, //33
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TopNewsWidget(
                      topNewsImage: homeTopNewsList[index].topNewsImage,
                      topNewsTitle: homeTopNewsList[index].topNewsTitle,
                      topNewsDescription:
                          homeTopNewsList[index].topNewsDescription,
                      topName: homeTopNewsList[index].topName,
                      topNewsAvatorImage: homeTopNewsList[index].topNewsAvator,
                      onPress: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Container();
                  },
                  itemCount: homeTopNewsList.length,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "All News",
                  style: TextStyle(
                    fontSize: context.textScaling <= 1.0 ? context.textScaling * 20 : 14, //18

                    fontFamily: payfairSemiBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                width: context.width, //335
                // color: Colors.green,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return const CardWidget();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
