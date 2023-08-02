import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/view/notification/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget(
      {super.key,
      this.title,
      this.image,
      this.surfixIcon,
      this.prefixIcon,
      this.username,
      this.centerTitle,
      this.appBarcolor,
      this.isNotification,
      this.iconContainerColor,
      this.titleFontSize,
      this.surfixContainerHeight,
      this.surfixContainerWidth,
      this.surfixContainerPadding,
      this.surfixIconSize,
      this.onPress,
      this.svgIcon,
      this.prefexLeftPadding = 5});
  final String? title;
  final double? titleFontSize;
  final String? username;
  final String? image;
  final IconData? surfixIcon;
  final String? prefixIcon;
  final double? surfixIconSize;
  final double? surfixContainerHeight, surfixContainerWidth;
  final String? centerTitle;
  final Color? appBarcolor;
  final Color? iconContainerColor;
  final bool? isNotification;
  final EdgeInsetsGeometry? surfixContainerPadding;
  final double? prefexLeftPadding;
  final VoidCallback? onPress;
  final String? svgIcon;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    double textScaling = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: context.width,
      height: context.height * 0.09,
      color: widget.appBarcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  widget.image == null
                      ? Container(
                          child: widget.image == null
                              ? Container(
                                  margin: widget.prefixIcon == null
                                      ? const EdgeInsets.only(left: 20)
                                      : const EdgeInsets.only(left: 20),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: widget.onPress,
                                    child: widget.prefixIcon != null
                                        ? SvgPicture.asset(
                                            "${widget.prefixIcon}")
                                        : Container(),
                                  ),
                                )
                              : Container())
                      : Image.asset(
                          '${widget.image}',
                          // width: 50,
                          // height: 30,
                        ),
                  widget.title != null
                      ? Container(
                          margin:
                              EdgeInsets.only(left: widget.prefexLeftPadding!),
                          child: Text(
                            '${widget.title}',
                            style: TextStyle(
                              fontFamily: interSemiBold,
                              fontSize: widget.titleFontSize ?? 16,
                            ),
                          ),
                        )
                      : Container(),
                  widget.username == null
                      ? Container()
                      : Text(
                          ', ${widget.username}',
                          style: TextStyle(
                            fontSize: textScaling <= 1.0
                                ? textScaling * 16
                                : 12, //14,
                            color: Colors.black,
                            fontFamily: interSemiBold,
                          ),
                        ),
                ],
              ),
              widget.centerTitle != null
                  ? Row(
                      children: [
                        Padding(
                          // padding on center text because left side prefix icon also 20 padding
                          padding: const EdgeInsets.only(right: 20),
                          child: Center(
                            child: Text(
                              '${widget.centerTitle}',
                              style: TextStyle(
                                fontSize: widget.titleFontSize,
                                fontFamily: interSemiBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              widget.surfixIcon != null
                  ? Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationPage()));
                          },
                          child: Container(
                            margin: widget.surfixContainerPadding ??
                                const EdgeInsets.only(right: 0),
                            width: widget.surfixContainerWidth ?? 50,
                            height: widget.surfixContainerHeight ?? 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0XFFD9D9D9),
                              ),
                              shape: BoxShape.circle,
                              color: widget.iconContainerColor,
                            ),
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: widget.onPress,
                                  child: SizedBox(
                                    child: Center(
                                      child: SizedBox(
                                        child: SvgPicture.asset(
                                          '${widget.svgIcon}',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                widget.isNotification == true
                                    ? Positioned(
                                        top: context.height * 0.010,
                                        left: context.width * 0.051, //27
                                        child: SvgPicture.asset(
                                          "assets/icons/ic_notification_dot.svg",
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
