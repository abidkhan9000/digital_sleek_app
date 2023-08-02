import 'dart:developer';

import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SwitchButtonWidget extends StatefulWidget {
  const SwitchButtonWidget(
      {super.key, this.icon, this.title, this.isSwitch, this.onPress});
  final String? icon;
  final String? title;
  final bool? isSwitch;
  final VoidCallback? onPress;

  @override
  State<SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    double textScaling = MediaQuery.of(context).textScaleFactor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: widget.onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  widget.icon!,
                  color: const Color(0XFF01303F),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${widget.title}',
                style: TextStyle(
                  fontSize: textScaling <= 1.0 ? textScaling * 16 : 12, //16,
                  fontFamily: 'Inter-Regular',
                ),
              ),
            ],
          ),
        ),
        widget.isSwitch ?? false == true
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                      scale: 1,
                      child: Switch(
                        value: isSwitched,
                        activeColor: Colors.white,
                        activeTrackColor: darkPrimaryColor,
                        onChanged: (bool value) {
                          setState(() {
                            isSwitched = value;
                            log("SWITCH: $isSwitched");
                          });
                        },
                        // inactiveThumbColor: Colors.redAccent,
                        // inactiveTrackColor: Colors.orange,
                      )),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
