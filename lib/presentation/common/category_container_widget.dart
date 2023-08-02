import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:flutter/material.dart';

class CategoryContainerWidget extends StatefulWidget {
  const CategoryContainerWidget({super.key, this.topNewsTitle});
  final String? topNewsTitle;

  @override
  State<CategoryContainerWidget> createState() =>
      _CategoryContainerWidgetState();
}

class _CategoryContainerWidgetState extends State<CategoryContainerWidget> {
  @override
  Widget build(BuildContext context) {


    return Container(
      // width: width * 0.28, //100
      height: context.height * 0.040, //33
      decoration: BoxDecoration(
        color: const Color(0XFF01303F),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '${widget.topNewsTitle}',
            style: TextStyle(
              color: Colors.white,
              fontSize: context.textScaling <= 1.0 ? context.textScaling * 10 : 10, //13
              fontFamily: intern,
            ),
          ),
        ),
      ),
    );
  }
}
