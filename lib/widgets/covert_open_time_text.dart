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
    int isActiveTemp = 0;
    var startAndEndTemp = "";
    List<OpenTime> dataList = [];
    List<Widget> resultList = [];
    for (int i = 0; i < dayList.length; i++) {
      int isActive = dayList[i].isActive ? 1 : 0;
      String startEnd = dayList[i].isActive
          ? "${dayList[i].startTime} - ${dayList[i].endTime}"
          : "ปิดทำการ";
      if (dayList[i].is24Hr && dayList[i].isActive) {
        startEnd = "เปิดตลอด 24 ชั่วโมง";
      }

      //Check same group
      if (isActive == isActiveTemp && startAndEndTemp == startEnd) {
        //save add same group
        dataList
            .add(OpenTime(dayOfWeek: dayList[i].dayOfWeek, timeStr: startEnd));
      } else {
        //not same start new group
        if (dataList.isNotEmpty) {
          //draw time first
          String start = "";
          if (dataList.length == 1) {
            start = getDayTH(dataList[0].dayOfWeek);
          } else {
            start = "${getDayTH(dataList[0].dayOfWeek, isShort: true)} - "
                "${getDayTH(dataList[dataList.length - 1].dayOfWeek, isShort: true)}";
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
                  text: dataList[0].timeStr,
                  color: const Color(0xff676A6F),
                ),
              ),
            ],
          ));
        }

        dataList = [];
        isActiveTemp = isActive;
        startAndEndTemp = startEnd;
        dataList.add(OpenTime(
            dayOfWeek: dayList[i].dayOfWeek, timeStr: startAndEndTemp));
      }
    }
    if (dataList.isNotEmpty) {
      //draw left
      String start = "";
      if (dataList.length == 1) {
        start = getDayTH(dataList[0].dayOfWeek);
      } else {
        start = "${getDayTH(dataList[0].dayOfWeek, isShort: true)} - "
            "${getDayTH(dataList[dataList.length - 1].dayOfWeek, isShort: true)}";
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
              text: dataList[0].timeStr,
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
