import 'package:flutter/material.dart';
import 'package:shop_schedule/constants/app_constants.dart';

class BaseText extends StatelessWidget {
  final Color color;
  final double textHeight;
  final double fontSize;
  final String text;
  final int? maxLines;
  final dynamic textAlign;
  final dynamic fontWeight;
  final dynamic textUnderline;
  final dynamic textUnderlineColor;
  final bool isEndStar;

  const BaseText(
      {this.textHeight = 1,
      this.maxLines,
      this.color = AppConstant.textColor,
      this.fontSize = 14,
      this.isEndStar = false,
      super.key,
      required this.text,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.textUnderline = TextDecoration.none,
      this.textUnderlineColor = AppConstant.redColor});

  Widget bText() {
    return Text(
      (text == "" || text == "null") ? "-" : text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          height: null,
          color: color,
          fontSize: fontSize,
          fontFamily: 'notosansthai',
          fontWeight: fontWeight,
          decoration: textUnderline,
          decorationColor: textUnderlineColor,
          overflow: TextOverflow.ellipsis),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isEndStar) {
      return RichText(
        text: TextSpan(children: [
          WidgetSpan(child: bText()),
          const TextSpan(
            text: "*",
            style: TextStyle(
              color: AppConstant.redColor,
              fontSize: 14,
              fontFamily: 'notosansthai',
            ),
          )
        ]),
      );
    } else {
      return bText();
    }
  }
}
