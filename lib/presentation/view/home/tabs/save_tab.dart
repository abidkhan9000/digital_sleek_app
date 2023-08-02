part of 'tab_path.dart';

class SaveTab extends StatefulWidget {
  const SaveTab({super.key, this.onPress});
  final VoidCallback? onPress;

  @override
  State<SaveTab> createState() => _SaveTabState();
}

class _SaveTabState extends State<SaveTab> {
  @override
  Widget build(BuildContext context) {
    List<HomeModel> homeTopNewsList = HomeModel.topNews;

    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationBarScreen(
                      value: 1,
                    )));
      },
      child: Scaffold(
        backgroundColor: white,
        body: Column(
          children: [
            SearchWidget(
              titleFontSize:  context.textScaling <= 1.0 ? context.textScaling * 16 : 12, //16,
              prefixIcon: 'assets/icons/ic_arrow.svg',
              centerTitle: saveBarText,
              appBarcolor: appBarColor,
              onPress: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavigationBarScreen(
                              value: 1,
                            )));
              },
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
            //
          ],
        ),
      ),
    );
  }
}
