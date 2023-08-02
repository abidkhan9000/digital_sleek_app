// import 'package:digital_sleeks/presentation/common/avatar_widget.dart';
// import 'package:digital_sleeks/presentation/resources/fonts.dart';
// import 'package:digital_sleeks/presentation/view/home/model.dart';
// import 'package:flutter/material.dart';

// class CardWidget extends StatefulWidget {
//   const CardWidget({super.key, this.serach});
//   final String? serach;

//   @override
//   State<CardWidget> createState() => CardWidgetState();
// }

// class CardWidgetState extends State<CardWidget> {
//   final List<HomeModel> _homeTopNewsList = HomeModel.topNews;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     double textScaling = MediaQuery.of(context).textScaleFactor;
//     return Container(
//       height: height * 0.15, //115
//       width: width - 40, //335
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 2,
//             offset: const Offset(0, 2), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: height * 0.010, //8
//             // bottom: height * 0.010,
//             left: width * 0.020, //8
//             child: Container(
//               width: width * 0.25, //96
//               height: height * 0.135, //96
//               decoration: BoxDecoration(
//                 // color: Colors.green,
//                 borderRadius: BorderRadius.circular(15),
//                 image: const DecorationImage(
//                   image: NetworkImage(
//                       "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1283&q=80"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: height * 0.010, //8
//             // bottom: height * 0.010, //8
//             left: width * 0.285, //100
//             child: SizedBox(
//               width: width * 0.60,
//               height: height * 0.15, //115
//               // color: Colors.yellow,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'AUTO',
//                     style: TextStyle(
//                       fontSize: 12 * textScaling,
//                       fontFamily: intern,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     'Mercedes-Benz EQS 580 launched in India, know price and features',
//                     style: TextStyle(
//                       fontSize: 13 * textScaling,
//                       fontFamily: intern,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   AvatarWidget(
//                     avatorImage: _homeTopNewsList[0].topNewsAvator,
//                     avatorName: _homeTopNewsList[0].topName,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
