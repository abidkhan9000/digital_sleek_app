import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/view/category/category_page.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key, this.categoryImage, this.categoryName});
  final String? categoryImage;
  final String? categoryName;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryPage(
                      categoryTitle: widget.categoryName,
                    )));
      },
      child: Container(
        // height: height * 0.078,
        // width: 130,
        // height: height * 0.04,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.07),
              // color: const Color(0xff0000000d).withOpacity(0.05),
              blurRadius: 25,
              offset: Offset(0, 20),
              // blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  '${widget.categoryImage}',
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${widget.categoryName}',
              style: TextStyle(
                fontSize: context.textScaling <= 1.0 ? context.textScaling * 12 : 9, //12
                fontFamily: "Inter-Regular",
              ),
            ),
            SizedBox(
              width: context.width * 0.040, //8
            ),
          ],
        ),
      ),
    );
  }
}
