import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget(
      {super.key,
      this.title,
      this.icon,
      this.iconColor,
      this.svg,
      this.buttonColor,
      this.notCenterText,
      this.onPress,
      this.centerTextColor,
      this.centerTextButtonSize,
      this.centerTextOpacityButton});
  final String? title;
  final IconData? icon;
  final Color? iconColor, buttonColor;
  final String? svg;
  final bool? notCenterText;
  final VoidCallback? onPress;
  final Color? centerTextColor;
  final double? centerTextButtonSize, centerTextOpacityButton;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    // double textScaling = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        width: context.width,
        height: 56,
        child: ElevatedButton(
          onPressed: widget.onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.buttonColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                width: 1,
                color: const Color(0xFF000033).withOpacity(.20),
              ),
            ),
          ),
          child: widget.notCenterText ?? true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Icon(
                    //   widget.icon,
                    //   color: widget.color,
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SvgPicture.asset(
                        widget.svg ?? '',
                        color: widget.iconColor,
                        width: 20,
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.15, //0.2
                    ),
                    Text(
                      widget.title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                        context.textScaling <= 1.0 ? context.textScaling * 14 : 12, //16,
                        fontFamily: intern,
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.title}',
                      style: TextStyle(
                        fontSize: context.textScaling <= 1.0
                            ? context.textScaling * widget.centerTextButtonSize!
                            : 14, //14,
                        color: widget.centerTextColor!
                            .withOpacity(widget.centerTextOpacityButton ?? 1),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
