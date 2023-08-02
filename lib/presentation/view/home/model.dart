import 'package:digital_sleek/presentation/resources/text.dart';

class HomeModel {
  final String? categorImagePath;
  final String? categoryName;
  final String? topNewsTitle;
  final String? topNewsImage;
  final String? topNewsDescription;
  final String? topNewsAvator;
  final String? topName;
  final String? topicName;
  final String? topicImage;

  HomeModel({
    this.categorImagePath,
    this.categoryName,
    this.topNewsTitle,
    this.topNewsDescription,
    this.topNewsAvator,
    this.topName,
    this.topNewsImage,
    this.topicName,
    this.topicImage,
  });

  static List<HomeModel> data = [
    HomeModel(
      categorImagePath:
          'https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&w=600',
      categoryName: categories[0],
    ),
    HomeModel(
      categorImagePath:
          'https://images.pexels.com/photos/1424246/pexels-photo-1424246.jpeg?auto=compress&cs=tinysrgb&w=600',
      categoryName: categories[1],
    ),
    HomeModel(
      categorImagePath:
          'https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&w=600',
      categoryName: categories[2],
    ),
    HomeModel(
      categorImagePath:
          'https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=600',
      categoryName: categories[3],
    ),
    HomeModel(
      categorImagePath:
          'https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    HomeModel(
      categorImagePath:
          'https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    HomeModel(
      categorImagePath:
          'https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    HomeModel(
      categorImagePath:
          'https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    HomeModel(
      categorImagePath:
          'https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
  ];

  static List<HomeModel> topNews = [
    HomeModel(
      topNewsImage: 'assets/images/news1.png',
      topNewsTitle: newsTitle[0],
      topNewsDescription: newsDescription[0],
      topNewsAvator: 'assets/images/men1.jpg',
      topName: newsAvatorName[0],
    ),
    HomeModel(
      topNewsImage: 'assets/images/news2.png',
      topNewsTitle: newsTitle[1].toString(),
      topNewsDescription: newsDescription[1],
      topNewsAvator: 'assets/images/men2.jpg',
      topName: newsAvatorName[1],
    ),
  ];

  static List<HomeModel> topic = [
    HomeModel(
      topicImage: 'assets/images/news1.png',
      topicName: "Digital Marketing",
    ),
    HomeModel(
      topicImage: 'assets/images/news1.png',
      topicName: "Auto",
    ),
    HomeModel(
      topicImage: 'assets/images/news1.png',
      topicName: "Sports",
    ),
    HomeModel(
      topicImage: 'assets/images/news1.png',
      topicName: "Cryptocurrency",
    ),
  ];
}
