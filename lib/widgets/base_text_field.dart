import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
      {this.leftPadding = 20,
      this.rightPadding = 20,
      this.fontSize = 16,
      this.isAddressField = false,
      this.maxLine = 1,
      this.suffectIcon,
      this.isHasErrorValidation = false,
      this.onTap,
      required this.hintText,
      Key? key,
      this.controller,
      this.prefixIcon,
      this.readOnly = false,
      this.margin = EdgeInsets.zero,
      this.onChanged,
      this.borderRadius = 10,
      this.maxLength,
      this.inputType = TextInputType.text,
      this.onPasswordTogglePressed,
      this.suffixText,
      this.isObscureText = false,
      this.borderColor,
      this.textAlign,
      this.initialValue,
      this.height = 50})
      : super(key: key);

  final double leftPadding;
  final double rightPadding;
  final double? fontSize;
  final GestureTapCallback? onTap;
  final bool isAddressField;
  final int? maxLine;
  final TextEditingController? controller;
  final EdgeInsetsGeometry margin;
  final String hintText;
  final String? suffixText;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool isHasErrorValidation;
  final Function(String)? onChanged;
  final Widget? suffectIcon;
  final double borderRadius;
  final int? maxLength;
  final dynamic inputType;
  final GestureTapCallback? onPasswordTogglePressed;
  final bool isObscureText;
  final TextAlign? textAlign;
  final Color? borderColor;
  final String? initialValue;
  final double height;
  // custom for this project

  Color getBorderColor() {
    if (isHasErrorValidation) {
      return Colors.red;
    } else {
      if (borderColor != null) {
        return borderColor!;
      } else {
        return const Color(0xffDDDDDD);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        padding: margin,
        width: double.infinity,
        child: TextFormField(
          initialValue: initialValue,
          textCapitalization: TextCapitalization.words,
          maxLength: maxLength,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
          },
          maxLines: maxLine,
          onTap: onTap,
          readOnly: readOnly,
          cursorColor: const Color(0xffDDDDDD),
          controller: controller,
          inputFormatters: inputType == TextInputType.phone
              ? [
                  LengthLimitingTextInputFormatter(12),
                ]
              : null,
          keyboardType: inputType,
          onChanged: onChanged,
          textAlignVertical: TextAlignVertical.bottom,
          textAlign: textAlign ?? TextAlign.start,
          style: TextStyle(color: Colors.black, fontSize: fontSize),
          decoration: InputDecoration(
            counterText: "",
            prefixIcon: prefixIcon,
            suffixIcon: suffectIcon,
            suffixText: suffixText,
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(0xff999999),
              fontSize: fontSize,
              fontFamily: 'notosansthai',
            ),
            filled: true,
            fillColor: readOnly ? Colors.grey.withOpacity(0.2) : Colors.white,
            contentPadding: EdgeInsets.only(
                left: leftPadding,
                top: isAddressField ? 60 : 16,
                bottom: isAddressField ? 0 : 16,
                right: rightPadding),
            focusedBorder: readOnly
                ? OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffDDDDDD),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? const Color(0xffDDDDDD),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: getBorderColor(), width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
