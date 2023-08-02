import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget(
      {super.key, this.topicName, this.topicImage, this.serach});
  final String? topicName;
  final String? topicImage;
  final String? serach;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width:  context.width * 0.45, //`180
      // height: 95, //95
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXNmEbgNGZSc8MQ-jLQfbu0SZJ-cTFJ4K7K3bfcXA-&s"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        // margin: EdgeInsets.only(top: height * 0.085), //80
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.0),
              Colors.black.withOpacity(0.70),

              // const Color(0xff000000).withOpacity(0.2),
              // const Color(0xff000000).withOpacity(0.3),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: context.height * 0.085), //80
          child: Center(
            child: Text(
              '${widget.topicName}',
              style: TextStyle(
                fontSize: context.textScaling <= 1.0 ? context.textScaling * 13 : 10, //13
                color: Colors.white,
                fontFamily: intern,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
