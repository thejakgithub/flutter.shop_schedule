import 'package:flutter/material.dart';
import 'package:shop_schedule/model/shop_schedule.dart';
import 'package:shop_schedule/widgets/base_text.dart';

class ConvertOpenTimeText extends StatelessWidget {
  const ConvertOpenTimeText({super.key, required this.dayList});

  final List<OpenTime> dayList;

  String getDayTH(int weekDay, {bool isShort = false}) {
    var weekTH = [
      "วันจันทร์",
      "วันอังคาร",
      "วันพุธ",
      "วันพฤหัสบดี",
      "วันศุกร์",
      "วันเสาร์",
      "วันอาทิตย์"
    ];
    var weekShortTH = [
      "จันทร์",
      "อังคาร",
      "พุธ",
      "พฤหัสบดี",
      "ศุกร์",
      "เสาร์",
      "อาทิตย์"
    ];
    return isShort ? weekShortTH[weekDay] : weekTH[weekDay];
  }

  @override
  Widget build(BuildContext context) {
    int sop = 0;
    var startAndEnd = "";
    List<OpenTime> listA = [];
    List<Widget> resultList = [];
    for (int i = 0; i < dayList.length; i++) {
      int index = dayList[i].isActive ? 1 : 0;
      String sne = dayList[i].isActive
          ? "${dayList[i].startTime} - ${dayList[i].endTime}"
          : "ปิดทำการ";
      if (dayList[i].is24Hr && dayList[i].isActive) {
        sne = "เปิดตลอด 24 ชั่วโมง";
      }

      if (index == sop && startAndEnd == sne) {
        //save add same group
        listA.add(OpenTime(dayOfWeek: dayList[i].dayOfWeek, timeStr: sne));
      } else {
        //not same start new group
        if (listA.isNotEmpty) {
          //draw time first
          String start = "";
          if (listA.length == 1) {
            start = getDayTH(listA[0].dayOfWeek);
          } else {
            start = "${getDayTH(listA[0].dayOfWeek, isShort: true)} -"
                "${getDayTH(listA[listA.length - 1].dayOfWeek, isShort: true)}";
          }

          resultList.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 130,
                  child: BaseText(
                    text: start,
                    color: const Color(0xff676A6F),
                  )),
              Expanded(
                child: BaseText(
                  text: listA[0].timeStr,
                  color: const Color(0xff676A6F),
                ),
              ),
            ],
          ));
        }

        listA = [];
        sop = index;
        startAndEnd = sne;
        listA.add(
            OpenTime(dayOfWeek: dayList[i].dayOfWeek, timeStr: startAndEnd));
      }
    }
    if (listA.isNotEmpty) {
      //draw left
      String start = "";
      if (listA.length == 1) {
        start = getDayTH(listA[0].dayOfWeek);
      } else {
        start = "${getDayTH(listA[0].dayOfWeek, isShort: true)} -"
            "${getDayTH(listA[listA.length - 1].dayOfWeek, isShort: true)}";
      }

      resultList.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 130,
              child: BaseText(
                text: start,
                color: const Color(0xff676A6F),
              )),
          Expanded(
            child: BaseText(
              text: listA[0].timeStr,
              color: const Color(0xff676A6F),
            ),
          ),
        ],
      ));
    }

    return Column(
      children: resultList,
    );
  }
}
