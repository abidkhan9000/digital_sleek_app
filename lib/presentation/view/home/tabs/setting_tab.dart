part of 'tab_path.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, this.isGuest});
  final bool? isGuest;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    getGuest();
    super.initState();
  }

  Future<bool> getGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isGuestIn = prefs.getBool('isGuestIn') ?? false;
    log('Gueste SHARED PRE is Login: $isGuestIn');
    return isGuestIn;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationBarScreen(
                      value: 2,
                    )));
      },
      child: Scaffold(
        backgroundColor: white,
        body: widget.isGuest != true
            ? Column(
                children: [
                  SearchWidget(
                    prefixIcon: 'assets/icons/ic_arrow.svg',
                    // centerTitle: settingBarText,
                    appBarcolor: appBarColor,
                    titleFontSize: context.textScaling <= 1.0
                        ? context.textScaling * 16
                        : 12, //16,
                    onPress: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationBarScreen(
                                    value: 2,
                                  )));
                    },
                  ),
                  Container(
                    color: white,
                    // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                    child: Column(
                      children: [
                        SizedBox(
                          // color: Colors.grey,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: context.height * 0.065, //50
                                  color: appBarColor,
                                ),
                              ),
                              Positioned(
                                child: _profileWidget(context.textScaling),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              const SwitchButtonWidget(
                                icon: 'assets/icons/ic_notification.svg',
                                title: "Notifications",
                                isSwitch: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //editProfile
                              SwitchButtonWidget(
                                icon: 'assets/icons/ic_about.svg',
                                title: "Edit profile",
                                onPress: () {
                                  editProfileBottomSheet(
                                      context,
                                      context.textScaling,
                                      context.height,
                                      context.width);
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const SwitchButtonWidget(
                                icon: 'assets/icons/ic_favorite.svg',
                                title: "Favorite",
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const SwitchButtonWidget(
                                icon: 'assets/icons/ic_share.svg',
                                title: "Invite friend",
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SwitchButtonWidget(
                                icon: 'assets/icons/ic_privacy _policy.svg',
                                title: "Privacy Policy",
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PrivacyPolicy()));
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const SwitchButtonWidget(
                                icon: 'assets/icons/ic_rate_app.svg',
                                title: "Rate app",
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SwitchButtonWidget(
                                icon: 'assets/icons/ic_logout.svg',
                                title: "Logout",
                                onPress: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.remove("isLoggedIn");

                                  logOut();

                                  await _auth.signOut();

                                  await _googleSignIn.signOut();

                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (_) {
                                    return const SplashScreen();
                                  }));
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SearchWidget(
                      prefixIcon: 'assets/icons/ic_arrow.svg',
                      // centerTitle: settingBarText,
                      appBarcolor: appBarColor,
                      titleFontSize: context.textScaling <= 1.0
                          ? context.textScaling * 16
                          : 12, //16,
                      onPress: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationBarScreen(
                                      value: 2,
                                    )));
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: context.height * 0.35,
                        ),
                        const NotFoundWidget(
                          text1: noLogin,
                          text2: noLoginDis,
                          buttonText: 'Login',
                          buttonTextColor: white,
                          buttonTextSize: 14,
                          buttonTextOpacity: 1,
                          buttonBgColor: darkPrimaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ButtonWidget(
                            title: 'Containue',
                            buttonColor: darkPrimaryColor,
                            centerTextButtonSize: 14,
                            centerTextColor: white,
                            centerTextOpacityButton: 1,
                            notCenterText: false,
                            onPress: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("isGuestIn");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectSignScreen()),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Future<dynamic> editProfileBottomSheet(
      BuildContext context, double textScaling, double height, double width) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * 0.02,
              ),
              Text(
                'Edit profile',
                style: TextStyle(
                  fontSize: textScaling <= 1.0 ? textScaling * 18 : 16, //18
                  fontFamily: interSemiBold,
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                // color: Colors.green,
                child: Stack(
                  children: [
                    const Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          radius: 17.0,
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.090, //70
                      left: width * 0.5, //200
                      child: SizedBox(
                        child: CircleAvatar(
                          backgroundColor: white,
                          radius: 12,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: white,
                            child: CircleAvatar(
                              backgroundColor: darkPrimaryColor,
                              child: SvgPicture.asset(
                                'assets/icons/ic_camera.svg',
                                color: white,
                                height: 13,
                                width: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: textScaling <= 1.0 ? textScaling * 14 : 13, //14
                  color: darkPrimaryColor,
                  fontFamily: intern,
                ),
              ),
              SizedBox(
                height: context.height * 0.006,
              ),
              const TextFieldWidget(),
              SizedBox(
                height: context.height * 0.02,
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: textScaling <= 1.0 ? textScaling * 14 : 13, //14
                  color: darkPrimaryColor,
                  fontFamily: intern,
                ),
              ),
              SizedBox(
                height: context.height * 0.006,
              ),
              const TextFieldWidget(
                email: 'abc123@gmail.com',
              ),
              ButtonWidget(
                buttonColor: darkPrimaryColor,
                title: 'Update',
                notCenterText: false,
                centerTextButtonSize: 14.0,
                centerTextColor: white,
                onPress: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _profileWidget(textScaling) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://media.gettyimages.com/id/1314489757/photo/smiling-hispanic-man-against-white-background.jpg?s=612x612&w=gi&k=20&c=mU_OXyCcBWewSUuA-IQE7LYuwo7FtHqX8pVnpNSSXcQ=",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              userName,
              style: TextStyle(
                fontSize: textScaling <= 1.0 ? textScaling * 20 : 15, //18,
                color: profileTextColor,
                fontFamily: interSemiBold,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              userGmail,
              style: TextStyle(
                fontFamily: 'Inter-Regular',
                fontSize: textScaling <= 1.0 ? textScaling * 12 : 9, //11,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void logOut() async {
    if (await _googleSignIn.isSignedIn()) {
      log('google logout');
      await _googleSignIn.signOut();
    } else {
      // User signed in with their Google account
      log('email logout');
      await _googleSignIn.signOut();
    }
  }
}
