import 'package:digital_sleek/presentation/resources/text.dart';

class SplashModel {
  final String? imagePath;
  final String? title;
  final String? desc;

  SplashModel({this.imagePath, this.title, this.desc});

  static List<SplashModel> data = [
    SplashModel(
      imagePath: 'assets/images/image1.png',
      title: heading1,
      desc: subTitle1,
    ),
    SplashModel(
      imagePath: 'assets/images/image2.png',
      title: heading2,
      desc: subTitle2,
    ),
    SplashModel(
      imagePath: 'assets/images/image3.png',
      title: heading3,
      desc: subTitle3,
    ),
  ];
}
