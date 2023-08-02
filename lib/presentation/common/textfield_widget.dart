import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.textInputType,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.isValid = false,
    this.isBorderRequired = true,
    this.titleText = "",
    this.maxline = 1,
    this.isShadowRequired = false,
    this.titleTextColor = Colors.black,
    this.suffixWidth = 15,
    this.suffixHeight = 15,
    this.onChanged,
    this.suffixIconIsVisible,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final bool isBorderRequired;
  final bool? isShadowRequired;
  final bool isValid;
  final int? maxline;
  final bool obscureText;
  final ValueChanged? onChanged;
  final String? prefixIcon;
  final double? suffixHeight;
  final Widget? suffixIcon;
  final bool? suffixIconIsVisible;
  final double? suffixWidth;
  final TextInputType textInputType;
  final String? titleText;
  final Color? titleTextColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final double borderRadius = 50;

  @override
  void initState() {
    _isHidden = widget.obscureText;
    super.initState();
  }

  bool _isHidden = false;

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleText!.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      widget.titleText!,
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.titleTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              )
            : Container(),
        Container(
          decoration: const BoxDecoration(
              // boxShadow: isShadowRequired! ? [AppShadow.normal()] : [],
              ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.isValid ? widget.validator : null,
            onChanged: widget.onChanged,
            keyboardType: widget.textInputType,
            obscureText: _isHidden,
            controller: widget.controller,
            maxLines: widget.maxline,
            cursorColor: darkPrimaryColor,
            style: const TextStyle(
              fontFamily: intern,
            ),
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon != null
                  ? Container(
                      margin: const EdgeInsets.only(left: 30, right: 10),
                      width: 18,
                      height: 18,
                      child: Center(
                        child: SvgPicture.asset(
                          '${widget.prefixIcon}',
                        ),
                      ),
                    )
                  : null,
              suffixIcon: widget.suffixIconIsVisible == true
                  ? GestureDetector(
                      // behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                      child: SizedBox(
                        width: 15,
                        height: 15,
                        child: Center(
                          child: widget.obscureText == true
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                    )
                  : null,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: widget.prefixIcon != null ? 10 : 20,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  borderRadius,
                ),
                borderSide: BorderSide(
                  color:
                      widget.isBorderRequired ? Colors.red : Colors.transparent,
                ),
              ),
              errorBorder: widget.isBorderRequired
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        borderRadius,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    )
                  : outlineInputBorder(),
              border: widget.isBorderRequired
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        borderRadius,
                      ),
                    )
                  : outlineInputBorder(),
              focusedBorder: widget.isBorderRequired
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        borderRadius,
                      ),
                      borderSide: BorderSide(
                        color: darkPrimaryColor.withOpacity(.5),
                      ),
                    )
                  : outlineInputBorder(),
              enabledBorder: widget.isBorderRequired
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        borderRadius,
                      ),
                      borderSide: BorderSide(
                        color: const Color(0xff000033).withOpacity(.15),
                      ),
                    )
                  : outlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
