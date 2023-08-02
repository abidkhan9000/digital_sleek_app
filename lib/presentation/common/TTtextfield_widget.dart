import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.name,
    this.isTextFieldEnabled,
    this.email,
    this.hint,
    this.svgIcon,
    this.onChange,
    this.controller,
    this.validator,
  });
  final String? name, email, hint;
  final String? svgIcon;
  final bool? isTextFieldEnabled;
  final ValueChanged? onChange;
  final TextEditingController? controller;
  final String? Function(String?)? validator;



  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    // double textScaling = MediaQuery.of(context).textScaleFactor;
    return Container(
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff000033).withOpacity(.15),
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //for svg

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 30,
              ),
              widget.svgIcon == null
                  ? Container()
                  : SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        widget.svgIcon ?? '',
                      ),
                    ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  validator: widget.validator,
                  controller: widget.controller,
                  onChanged: widget.onChange,
                  // enableInteractiveSelection: false,
                  readOnly: widget.email == null ? false : true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.email ?? widget.hint,
                    hintStyle: TextStyle(
                      fontSize:  context.textScaling <= 1.0 ? context.textScaling * 14 : 15, //14
                    ),
                    // contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),),
            ],
          ),
          //for textfield
        ],
      ),
    );
  }
}
