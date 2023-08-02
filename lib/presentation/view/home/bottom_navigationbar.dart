part of 'path.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key, this.value, this.isGuest});
  final int? value;
  final bool? isGuest;

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  void initState() {
    super.initState();

    switch (widget.value) {
      case 1:
        _selectedIndex = widget.value!;
        break;
      case 2:
        _selectedIndex = 2;
        break;
      case 3:
        _selectedIndex = 3;
        break;
    }
    log("NEW PAGE");
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // double textScaling = MediaQuery.of(context).textScaleFactor;

    bool isGuest;

    @override
    void initState() {
      super.initState();
      isGuest = widget.isGuest!;
      //...
    }

    List<Widget> _widgetOptions = <Widget>[
      HomeTab(),
      SearchScreen(),
      SaveTab(),
      SettingScreen(isGuest: widget.isGuest),
    ];

    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav(
              selectedIndex: _selectedIndex,
              tabBackgroundColor: darkPrimaryColor,
              tabBorderRadius: 35.0,
              backgroundColor: Colors.white,
              // activeColor: Colors.white,
              color: Colors.grey,

              padding: const EdgeInsets.all(10),
              gap: 8,
              onTabChange: (index) {
                log('Tab Index: $index');
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                  textStyle: TextStyle(
                    fontSize: context.textScaling <= 1.0
                        ? context.textScaling * 14
                        : 11, //14,
                    color: white,
                    fontFamily: intern,
                  ),
                  leading: SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      "assets/icons/ic_home.svg",
                      color: _selectedIndex == 0
                          ? white
                          : Colors.grey.withOpacity(.5),
                    ),
                  ),
                ),
                GButton(
                  icon: Iconsax.search_normal,
                  text: "Search",
                  textStyle: TextStyle(
                    fontSize: context.textScaling <= 1.0
                        ? context.textScaling * 14
                        : 11, //14,
                    color: white,
                    fontFamily: intern,
                  ),
                  leading: SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      "assets/icons/ic_search.svg",
                      color: _selectedIndex == 1
                          ? white
                          : Colors.grey.withOpacity(.5),
                    ),
                  ),
                ),
                GButton(
                  icon: Icons.bookmark,
                  text: "Save",
                  textStyle: TextStyle(
                    fontSize: context.textScaling <= 1.0
                        ? context.textScaling * 14
                        : 11, //14,
                    color: white,
                    fontFamily: intern,
                  ),
                  leading: SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      "assets/icons/ic_bookmark.svg",
                      color: _selectedIndex == 2
                          ? white
                          : Colors.grey.withOpacity(.5),
                    ),
                  ),
                ),
                GButton(
                  icon: Icons.settings,
                  text: "Setting",
                  textStyle: TextStyle(
                    fontSize: context.textScaling <= 1.0
                        ? context.textScaling * 14
                        : 11, //14,
                    color: white,
                    fontFamily: intern,
                  ),
                  leading: SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      "assets/icons/ic_setting.svg",
                      color: _selectedIndex == 3
                          ? white
                          : Colors.grey.withOpacity(.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
