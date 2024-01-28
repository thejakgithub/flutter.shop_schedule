import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_schedule/constants/app_constants.dart';
import 'package:shop_schedule/constants/images.dart';
import 'package:shop_schedule/model/shop_schedule.dart';
import 'package:shop_schedule/view_model/shop_provider.dart';
import 'package:shop_schedule/widgets/base_app_bar.dart';
import 'package:shop_schedule/widgets/base_checkbox.dart';
import 'package:shop_schedule/widgets/base_input_switch.dart';
import 'package:shop_schedule/widgets/base_text.dart';

class ShopScheduleEditScreen extends StatefulWidget {
  const ShopScheduleEditScreen({super.key});

  @override
  State<ShopScheduleEditScreen> createState() => _ShopScheduleEditScreenState();
}

class _ShopScheduleEditScreenState extends State<ShopScheduleEditScreen> {
  ShopSchedule schedule = ShopSchedule();

  @override
  void initState() {
    schedule = Provider.of<ShopProvider>(context, listen: false).schedule;
    super.initState();
  }

  void onConfirm() {
    // Validate time open - close
    if (schedule.mondayFromTime.compareTo(schedule.mondayToTime) > 0 &&
        schedule.monday24hours == "0" &&
        schedule.monday == "1") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: BaseText(
            text: "กรุณาเลือกเวลาเปิด - ปิด ให้ถูกต้อง",
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: AppConstant.textColor,
        ),
      );
    } else if (schedule.tuesdayFromTime.compareTo(schedule.tuesdayToTime) > 0 &&
        schedule.tuesday24hours == "0" &&
        schedule.tuesday == "1") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: BaseText(
            text: "กรุณาเลือกเวลาเปิด - ปิด ให้ถูกต้อง",
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: AppConstant.textColor,
        ),
      );
    } else if (schedule.wednesdayFromTime.compareTo(schedule.wednesdayToTime) >
            0 &&
        schedule.wednesday24hours == "0" &&
        schedule.wednesday == "1") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: BaseText(
            text: "กรุณาเลือกเวลาเปิด - ปิด ให้ถูกต้อง",
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: AppConstant.textColor,
        ),
      );
    } else if (schedule.thursdayFromTime.compareTo(schedule.thursdayToTime) >
            0 &&
        schedule.thursday24hours == "0" &&
        schedule.thursday == "1") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: BaseText(
            text: "กรุณาเลือกเวลาเปิด - ปิด ให้ถูกต้อง",
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: AppConstant.textColor,
        ),
      );
    } else if (schedule.fridayFromTime.compareTo(schedule.fridayToTime) > 0 &&
        schedule.friday24hours == "0" &&
        schedule.friday == "1") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: BaseText(
            text: "กรุณาเลือกเวลาเปิด - ปิด ให้ถูกต้อง",
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: AppConstant.textColor,
        ),
      );
    } else if (schedule.saturdayFromTime.compareTo(schedule.saturdayToTime) >
            0 &&
        schedule.saturday24hours == "0" &&
        schedule.saturday == "1") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: BaseText(
            text: "กรุณาเลือกเวลาเปิด - ปิด ให้ถูกต้อง",
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: AppConstant.textColor,
        ),
      );
    } else if (schedule.sundayFromTime.compareTo(schedule.sundayToTime) > 0 &&
        schedule.sunday24hours == "0" &&
        schedule.sunday == "1") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: BaseText(
            text: "กรุณาเลือกเวลาเปิด - ปิด ให้ถูกต้อง",
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: AppConstant.textColor,
        ),
      );
    } else {
      // Back to Home Screen and set Shop Schedule
      Provider.of<ShopProvider>(context, listen: false)
          .setShopSchedule(schedule);
      Navigator.pop(context);
    }
  }

  bool getChkVal(day) {
    if (day == "วันจันทร์") {
      return schedule.monday24hours == "1" ? true : false;
    } else if (day == "วันอังคาร") {
      return schedule.tuesday24hours == "1" ? true : false;
    } else if (day == "วันพุธ") {
      return schedule.wednesday24hours == "1" ? true : false;
    } else if (day == "วันพฤหัสบดี") {
      return schedule.thursday24hours == "1" ? true : false;
    } else if (day == "วันศุกร์") {
      return schedule.friday24hours == "1" ? true : false;
    } else if (day == "วันเสาร์") {
      return schedule.saturday24hours == "1" ? true : false;
    } else if (day == "วันอาทิตย์") {
      return schedule.sunday24hours == "1" ? true : false;
    } else {
      return false;
    }
  }

  String getFromTimeText(day) {
    if (day == "วันจันทร์") {
      return schedule.mondayFromTime;
    } else if (day == "วันอังคาร") {
      return schedule.tuesdayFromTime;
    } else if (day == "วันพุธ") {
      return schedule.wednesdayFromTime;
    } else if (day == "วันพฤหัสบดี") {
      return schedule.thursdayFromTime;
    } else if (day == "วันศุกร์") {
      return schedule.fridayFromTime;
    } else if (day == "วันเสาร์") {
      return schedule.saturdayFromTime;
    } else if (day == "วันอาทิตย์") {
      return schedule.sundayFromTime;
    } else {
      return "00:00";
    }
  }

  String getToTimeText(day) {
    if (day == "วันจันทร์") {
      return schedule.mondayToTime;
    } else if (day == "วันอังคาร") {
      return schedule.tuesdayToTime;
    } else if (day == "วันพุธ") {
      return schedule.wednesdayToTime;
    } else if (day == "วันพฤหัสบดี") {
      return schedule.thursdayToTime;
    } else if (day == "วันศุกร์") {
      return schedule.fridayToTime;
    } else if (day == "วันเสาร์") {
      return schedule.saturdayToTime;
    } else if (day == "วันอาทิตย์") {
      return schedule.sundayToTime;
    } else {
      return "23:59";
    }
  }

  TimeOfDay getTimeOfDayFromTime(day) {
    int hr = 0;
    int m = 0;

    if (day == "วันจันทร์") {
      hr = int.parse(schedule.mondayFromTime.substring(0, 2));
      m = int.parse(schedule.mondayFromTime.substring(3, 5));
    } else if (day == "วันอังคาร") {
      hr = int.parse(schedule.tuesdayFromTime.substring(0, 2));
      m = int.parse(schedule.tuesdayFromTime.substring(3, 5));
    } else if (day == "วันพุธ") {
      hr = int.parse(schedule.wednesdayFromTime.substring(0, 2));
      m = int.parse(schedule.wednesdayFromTime.substring(3, 5));
    } else if (day == "วันพฤหัสบดี") {
      hr = int.parse(schedule.thursdayFromTime.substring(0, 2));
      m = int.parse(schedule.thursdayFromTime.substring(3, 5));
    } else if (day == "วันศุกร์") {
      hr = int.parse(schedule.fridayFromTime.substring(0, 2));
      m = int.parse(schedule.fridayFromTime.substring(3, 5));
    } else if (day == "วันเสาร์") {
      hr = int.parse(schedule.saturdayFromTime.substring(0, 2));
      m = int.parse(schedule.saturdayFromTime.substring(3, 5));
    } else if (day == "วันอาทิตย์") {
      hr = int.parse(schedule.sundayFromTime.substring(0, 2));
      m = int.parse(schedule.sundayFromTime.substring(3, 5));
    }

    return TimeOfDay(hour: hr, minute: m);
  }

  TimeOfDay getTimeOfDayToTime(day) {
    int hr = 0;
    int m = 0;

    if (day == "วันจันทร์") {
      hr = int.parse(schedule.mondayToTime.substring(0, 2));
      m = int.parse(schedule.mondayToTime.substring(3, 5));
    } else if (day == "วันอังคาร") {
      hr = int.parse(schedule.tuesdayToTime.substring(0, 2));
      m = int.parse(schedule.tuesdayToTime.substring(3, 5));
    } else if (day == "วันพุธ") {
      hr = int.parse(schedule.wednesdayToTime.substring(0, 2));
      m = int.parse(schedule.wednesdayToTime.substring(3, 5));
    } else if (day == "วันพฤหัสบดี") {
      hr = int.parse(schedule.thursdayToTime.substring(0, 2));
      m = int.parse(schedule.thursdayToTime.substring(3, 5));
    } else if (day == "วันศุกร์") {
      hr = int.parse(schedule.fridayToTime.substring(0, 2));
      m = int.parse(schedule.fridayToTime.substring(3, 5));
    } else if (day == "วันเสาร์") {
      hr = int.parse(schedule.saturdayToTime.substring(0, 2));
      m = int.parse(schedule.saturdayToTime.substring(3, 5));
    } else if (day == "วันอาทิตย์") {
      hr = int.parse(schedule.sundayToTime.substring(0, 2));
      m = int.parse(schedule.sundayToTime.substring(3, 5));
    }

    return TimeOfDay(hour: hr, minute: m);
  }

  _cardOpenShop() {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: BaseInputSwitch(
                  title: "เปิด - ปิด ทำการร้านค้า",
                  isCheck: schedule.status == "1" ? true : false,
                  color: AppConstant.greenColor,
                  onCheck: (isCheck) {
                    setState(() {
                      schedule.status = isCheck ? "1" : "0";
                    });
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _cardScheduleShop() {
    List<Map<String, Object>> scheduleList = [
      {
        "day": "วันจันทร์",
        "isOpen": schedule.monday,
        "24hour": schedule.monday24hours,
        "formTime": schedule.mondayFromTime,
        "toTime": schedule.mondayToTime,
      },
      {
        "day": "วันอังคาร",
        "isOpen": schedule.tuesday,
        "24hour": schedule.tuesday24hours,
        "formTime": schedule.tuesdayFromTime,
        "toTime": schedule.tuesdayToTime,
      },
      {
        "day": "วันพุธ",
        "isOpen": schedule.wednesday,
        "24hour": schedule.wednesday24hours,
        "formTime": schedule.wednesdayFromTime,
        "toTime": schedule.wednesdayToTime,
      },
      {
        "day": "วันพฤหัสบดี",
        "isOpen": schedule.thursday,
        "24hour": schedule.thursday24hours,
        "formTime": schedule.thursdayFromTime,
        "toTime": schedule.thursdayToTime,
      },
      {
        "day": "วันศุกร์",
        "isOpen": schedule.friday,
        "24hour": schedule.friday24hours,
        "formTime": schedule.fridayFromTime,
        "toTime": schedule.fridayToTime,
      },
      {
        "day": "วันเสาร์",
        "isOpen": schedule.saturday,
        "24hour": schedule.saturday24hours,
        "formTime": schedule.saturdayFromTime,
        "toTime": schedule.saturdayToTime,
      },
      {
        "day": "วันอาทิตย์",
        "isOpen": schedule.sunday,
        "24hour": schedule.sunday24hours,
        "formTime": schedule.sundayFromTime,
        "toTime": schedule.sundayToTime,
      },
    ];

    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      child: Column(
        children: [
          for (var data in scheduleList)
            Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: BaseInputSwitch(
                      title: data["day"].toString(),
                      isCheck: data["isOpen"] == "1" ? true : false,
                      color: AppConstant.greenColor,
                      onCheck: (isCheck) {
                        setState(() {
                          if (data["day"] == "วันจันทร์") {
                            schedule.monday = isCheck ? "1" : "0";
                          } else if (data["day"] == "วันอังคาร") {
                            schedule.tuesday = isCheck ? "1" : "0";
                          } else if (data["day"] == "วันพุธ") {
                            schedule.wednesday = isCheck ? "1" : "0";
                          } else if (data["day"] == "วันพฤหัสบดี") {
                            schedule.thursday = isCheck ? "1" : "0";
                          } else if (data["day"] == "วันศุกร์") {
                            schedule.friday = isCheck ? "1" : "0";
                          } else if (data["day"] == "วันเสาร์") {
                            schedule.saturday = isCheck ? "1" : "0";
                          } else if (data["day"] == "วันอาทิตย์") {
                            schedule.sunday = isCheck ? "1" : "0";
                          }
                        });
                      },
                    ),
                  ),
                ),
                if (data["isOpen"] == "1")
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: BaseCheckbox(
                          isCircle: true,
                          label: "เปิดตลอด 24 ชั่วโมง",
                          fontSize: 16,
                          value: getChkVal(data["day"]),
                          onChanged: (isCheck) {
                            setState(() {
                              if (data["day"] == "วันจันทร์") {
                                schedule.monday24hours = isCheck ? "1" : "0";
                              } else if (data["day"] == "วันอังคาร") {
                                schedule.tuesday24hours = isCheck ? "1" : "0";
                              } else if (data["day"] == "วันพุธ") {
                                schedule.wednesday24hours = isCheck ? "1" : "0";
                              } else if (data["day"] == "วันพฤหัสบดี") {
                                schedule.thursday24hours = isCheck ? "1" : "0";
                              } else if (data["day"] == "วันศุกร์") {
                                schedule.friday24hours = isCheck ? "1" : "0";
                              } else if (data["day"] == "วันเสาร์") {
                                schedule.saturday24hours = isCheck ? "1" : "0";
                              } else if (data["day"] == "วันอาทิตย์") {
                                schedule.sunday24hours = isCheck ? "1" : "0";
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BaseText(text: "เปิด"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 45.0,
                                    width: double.infinity,
                                    child: InkWell(
                                      customBorder: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      onTap: () async {
                                        TimeOfDay? pickedTime =
                                            await showTimePicker(
                                          initialTime:
                                              getTimeOfDayFromTime(data["day"]),
                                          context: context,
                                        );
                                        setState(() {
                                          if (data["day"] == "วันจันทร์") {
                                            schedule.mondayFromTime =
                                                schedule.mondayFromTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันอังคาร") {
                                            schedule.tuesdayFromTime =
                                                schedule.tuesdayFromTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] == "วันพุธ") {
                                            schedule.wednesdayFromTime =
                                                schedule.wednesdayFromTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันพฤหัสบดี") {
                                            schedule.thursdayFromTime =
                                                schedule.thursdayFromTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันศุกร์") {
                                            schedule.fridayFromTime =
                                                schedule.fridayFromTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันเสาร์") {
                                            schedule.saturdayFromTime =
                                                schedule.saturdayFromTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันอาทิตย์") {
                                            schedule.sundayFromTime =
                                                schedule.sundayFromTime =
                                                    pickedTime!.format(context);
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffDDDDDD),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: BaseText(
                                                  text: getFromTimeText(
                                                      data["day"]),
                                                  color: AppConstant.textColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              SvgPicture.asset(
                                                Images.icArrowDown,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.only(top: 20, left: 10, right: 10),
                              child: BaseText(text: "-"),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BaseText(text: "ปิด"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 45.0,
                                    width: double.infinity,
                                    child: InkWell(
                                      customBorder: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      onTap: () async {
                                        TimeOfDay? pickedTime =
                                            await showTimePicker(
                                          initialTime:
                                              getTimeOfDayToTime(data["day"]),
                                          context: context,
                                        );

                                        setState(() {
                                          if (data["day"] == "วันจันทร์") {
                                            schedule.mondayToTime =
                                                schedule.mondayToTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันอังคาร") {
                                            schedule.tuesdayToTime =
                                                schedule.tuesdayToTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] == "วันพุธ") {
                                            schedule.wednesdayToTime =
                                                schedule.wednesdayToTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันพฤหัสบดี") {
                                            schedule.thursdayToTime =
                                                schedule.thursdayToTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันศุกร์") {
                                            schedule.fridayToTime =
                                                schedule.fridayToTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันเสาร์") {
                                            schedule.saturdayToTime =
                                                schedule.saturdayToTime =
                                                    pickedTime!.format(context);
                                          } else if (data["day"] ==
                                              "วันอาทิตย์") {
                                            schedule.sundayToTime =
                                                schedule.sundayToTime =
                                                    pickedTime!.format(context);
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffDDDDDD),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: BaseText(
                                                  text: getToTimeText(
                                                      data["day"]),
                                                  color: AppConstant.textColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              SvgPicture.asset(
                                                Images.icArrowDown,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                if (scheduleList.last != data)
                  const Divider(
                    height: 1,
                    color: AppConstant.borderColor,
                    indent: 15,
                    endIndent: 15,
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _mainSchedule() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          _cardOpenShop(),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: BaseText(
              text: "เวลาเปิด - ปิด ทำการ",
              fontWeight: FontWeight.w500,
            ),
          ),
          _cardScheduleShop(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: BaseAppBar(
          titleText: "วันเวลาเปิด - ปิด ร้านค้า",
          actionText: "บันทึก",
          onPress: () => onConfirm(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: _mainSchedule(),
      ),
    );
  }
}
