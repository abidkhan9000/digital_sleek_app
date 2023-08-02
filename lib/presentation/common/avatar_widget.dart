import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({
    super.key,
    this.avatorName,
    this.avatorImage,
    this.color,
    this.avatorHeight = 32,
    this.fontSize = 11,
    this.spaceBetweenSize,
  });
  final String? avatorName;
  final String? avatorImage;
  final Color? color;
  final double? avatorHeight;
  final double? fontSize;
  final double? spaceBetweenSize;

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width - 17,
      height: widget.avatorHeight, //height * 0.035

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(
              '${widget.avatorImage}',
            ),
          ),
          SizedBox(
            width: widget.spaceBetweenSize ?? context.width * 0.011, //10,
          ),
          Text(
            '${widget.avatorName}',
            style: TextStyle(
              fontSize:
              context.textScaling <= 1.0 ? context.textScaling * widget.fontSize! : 8, //11
              fontFamily: intern,
              color: widget.color,
            ),
          ),
        ],
      ),
    );
  }
}
