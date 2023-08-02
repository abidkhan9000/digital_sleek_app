part of 'tab_path.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    // Future.wait([HomeService.fetchCategories()]);
    context.read<HomeCubit>().fetchData();

    super.initState();
  }

  // Future<bool> _onBackButtonPress(BuildContext context) async {
  //   bool exitApp = await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Do you want to exit'),
  //         content: const Text('Do you want to close the app?'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(false);
  //             },
  //             child: const Text('No'),
  //           ),
  //           //flateButton
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(true);
  //             },
  //             child: const Text('Yes'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //   return exitApp;
  // }

  @override
  Widget build(BuildContext context) {
    List<HomeModel> homeList = HomeModel.data;
    List<HomeModel> homeTopNewsList = HomeModel.topNews;
    List<HomeModel> homeNewsTopicList = HomeModel.topic;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: Text('Tap back to again to exit'),
              ),
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: SearchWidget(
                // appBarcolor: Colors.green,
                title: morning,
                image: "assets/images/handclapping.png",
                svgIcon: "assets/icons/ic_notification.svg",
                username: name,
                surfixIcon: Icons.notifications_none_outlined,
                surfixIconSize: 25,
                surfixContainerWidth: 40,
                surfixContainerHeight: 40,
                iconContainerColor: white,
                isNotification: true,
                titleFontSize: context.textScaling <= 1.0
                    ? context.textScaling * 16
                    : 10, //14,
                // appBarcolor: Colors.green,
              ),
            ),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is HomeLoadingState) {
                  log("Category Data Loading...");
                }
                if (state is HomeScussesState) {
                  if (state.model != null) {
                    for (var category in state.model!) {
                      log('Category name: ${category.name}, ID: ${category.id}');
                    }
                    log("Category Data Fetched...");
                  }
                  log('Data is: ${state.model?.length}');

                  // log("Data is: ${state.model!.length}");
                } else if (state is HomeErrorState) {
                  log("Category Fetech Failed ${state.error}");
                }
              },
              builder: (context, state) {
                // log("DData ${state?.model?.length ?? 0}");
                if (state is HomeLoadingState) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is HomeScussesState) {
                  final categoryData = state.model;
                  return SizedBox(
                    width: context.width,
                    height: context.height * 0.065,
                    // color: Colors.white,
                    child: ListView.separated(
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // final category = (context.read<HomeCubit>().state
                        //         as HomeScussesState)
                        //     .model![index];

                        return CategoryWidget(
                          categoryImage: homeList[index].categorImagePath,
                          categoryName: categoryData![index].name,
                        );
                      },
                      separatorBuilder: ((context, index) {
                        return const SizedBox(
                          width: 12,
                        );
                      }),
                      itemCount: state.model!.length - 1,
                    ),
                  );
                }
                return Container();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top News",
                            style: TextStyle(
                              fontSize: context.textScaling <= 1.0
                                  ? context.textScaling * 20
                                  : 14, //18
                              fontFamily: payfairSemiBold,
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                              fontSize: context.textScaling <= 1.0
                                  ? context.textScaling * 12
                                  : 8, //12
                              fontFamily: interSemiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: context.width, //350
                      height: context.height * 0.27, //33
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return TopNewsWidget(
                            topNewsImage: homeTopNewsList[index].topNewsImage,
                            topNewsTitle: homeTopNewsList[index].topNewsTitle,
                            topNewsDescription:
                                homeTopNewsList[index].topNewsDescription,
                            topName: homeTopNewsList[index].topName,
                            topNewsAvatorImage:
                                homeTopNewsList[index].topNewsAvator,
                            onPress: () {
                              Navigator.pop(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: ((context) =>
                              //             const BottomNavigationBarScreen())));
                            },
                            // onPress: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => ArticalScreen(
                            //                 topNewsImage: homeTopNewsList[index]
                            //                     .topNewsImage,
                            //                 newsTitle: homeTopNewsList[index]
                            //                     .topNewsTitle,
                            //                 userImage: homeTopNewsList[index]
                            //                     .topNewsAvator,
                            //                 name: homeTopNewsList[index]
                            //                     .topNewsAvator,
                            //                 newsDescription:
                            //                     homeTopNewsList[index]
                            //                         .topNewsDescription,
                            //               )));
                            // },
                          );
                        },
                        separatorBuilder: (_, index) {
                          return Container();
                        },
                        itemCount: homeTopNewsList.length,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        "Today's News",
                        style: TextStyle(
                          fontSize: context.textScaling <= 1.0
                              ? context.textScaling * 20
                              : 14, //18

                          fontFamily: payfairSemiBold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: context.width, //335
                      // color: Colors.green,
                      child: ListView.separated(
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const CardWidget();
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 15);
                        },
                        itemCount: 3,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Topics",
                        style: TextStyle(
                          fontSize: context.textScaling <= 1.0
                              ? context.textScaling * 20
                              : 14, //18
                          fontFamily: payfairSemiBold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 15,
                                childAspectRatio: 1.7),
                        itemBuilder: (context, index) {
                          return GridViewWidget(
                            topicName: homeNewsTopicList[index].topicName,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        'Trending News',
                        style: TextStyle(
                          fontSize: context.textScaling <= 1.0
                              ? context.textScaling * 20
                              : 14, //18
                          fontFamily: payfairSemiBold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      width: context.width, //335
                      // color: Colors.green,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
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
          ],
        ),
      ),
    );
  }
}
