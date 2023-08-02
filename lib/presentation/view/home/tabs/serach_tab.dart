part of 'tab_path.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<HomeModel> _homeNewsTopicList = HomeModel.topic;
  final bool? notFounSearched = true;

  final List<dynamic> _cards = [
    const CardWidget(serach: "aa"),
    const CardWidget(serach: "cc"),
  ];

  final List<dynamic> _notFoundWidet = [
    const NotFoundWidget(),
  ];

  List<dynamic>? _filteredCards;
  String? _searchQuery;
  ListTile? tile;

  void _filterCards(String query) {
    setState(() {
      _filteredCards = _cards
          .where((card) {
            return card.serach!.contains(query);
          })
          .cast<dynamic>()
          .toList();
      _searchQuery = query;
    });
    // log('ddd: ${_filteredCards}');
    if (_filteredCards!.isEmpty) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _filteredCards = _cards.toList();

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationBarScreen(
                      value: 0,
                    )));
      },
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchWidget(
                title: serachBarText,
                titleFontSize: context.textScaling <= 1.0 ? context.textScaling * 16 : 12, //16,
                appBarcolor: appBarColor,
                prefexLeftPadding: 0,
                svgIcon: "assets/icons/ic_cross.svg",
                surfixIcon: Icons.close,
                iconContainerColor: const Color(0XFFc2ced1),
                surfixContainerHeight: 40,
                surfixContainerWidth: 40,
                surfixIconSize: 15,
                surfixContainerPadding: const EdgeInsets.only(right: 10),
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigationBarScreen(
                                value: 0,
                              )));
                },
              ),
              Container(
                color: white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _searchWidget(context.textScaling, notFounSearched),
                    const SizedBox(
                      height: 5,
                    ),
                    _searchController.text.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 5),
                                child: Text(
                                  "Suggest Topics",
                                  style: TextStyle(
                                    fontSize: context.textScaling <= 1.0
                                        ? context.textScaling * 18
                                        : 14, //18
                                    fontFamily: payfairSemiBold,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                // height: 400, // 150
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
                                      topicName:
                                          _homeNewsTopicList[index].topicName,
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              _filteredCards!.isEmpty == true
                                  ? Container(
                                      padding: EdgeInsets.only(
                                          top: context.height * 0.25),
                                      child: const Center(
                                        child: NotFoundWidget(
                                          svg: 'assets/icons/ic_notfound.svg',
                                          text1: noResultFound,
                                          text2: noResultFoundDis,
                                          // buttonText: 'Containue',
                                          // buttonTextColor: black,
                                          // buttonTextSize: 14,
                                          // buttonTextOpacity: .5,
                                          // buttonBgColor: Colors.white,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: context.height * 0.2, // 150
                                      child: ListView.separated(
                                        itemCount: _filteredCards!.length,
                                        itemBuilder: (context, index) {
                                          return _filteredCards!.isNotEmpty
                                              ? _filteredCards![index]
                                              : _notFoundWidet[0];
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            height: 10,
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // NotFoundWidget(
                    //   text1: noLogin,
                    //   text2: noLoginDis,
                    //   buttonText: 'Login',
                    //   buttonTextColor: white,
                    //   buttonTextSize: 14,
                    //   buttonTextOpacity: 1,
                    //   buttonBgColor: darkPrimaryColor,
                    // ),
                    // ButtonWidget(
                    //   title: 'Containue',
                    //   buttonColor: darkPrimaryColor,
                    //   centerTextButtonSize: 14,
                    //   centerTextColor: white,
                    //   centerTextOpacityButton: 1,
                    //   notCenterText: false,
                    //   onPress: () {},
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchWidget(textScaling, notFounSearched) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            // color: const Color(0xff0000000d).withOpacity(0.05),
            blurRadius: 30,
            offset: Offset(0, 20),
            spreadRadius: -10,
            // blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        keyboardType: TextInputType.text,
        onChanged: _filterCards,
        onSubmitted: (value) {
          log('value: $_searchQuery');
          if (_filteredCards!.isEmpty) {
            setState(() {
              notFounSearched = true;
            });
          } else {
            setState(() {
              notFounSearched = false;
            });
          }
          log('SEARCH_______________________: $notFounSearched');
        },

        // onEditingComplete: () {

        //   if (_searchController != _searchQuery) {
        //     notFounSearched = true;
        //   }
        // },

        style: TextStyle(
          fontSize: textScaling <= 1.0 ? textScaling * 15 : 11,
        ), //14,
        decoration: InputDecoration(
          hintText: 'Search articles',
          hintStyle: TextStyle(
            fontSize: textScaling <= 1.0 ? textScaling * 15 : 13,
          ), //14

          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: InputBorder.none,
          prefixIcon: InkWell(
            child: SvgPicture.asset(
              'assets/icons/ic_search.svg',
              fit: BoxFit.scaleDown,
              width: 20,
              height: 20,
            ),
            // Icon(
            //   Iconsax.search_normal,
            //   color: serachIconColor,
            // ),
          ),
        ),
      ),
    );
  }
}
