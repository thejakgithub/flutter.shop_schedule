import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_schedule/constants/app_constants.dart';
import 'package:shop_schedule/constants/images.dart';
import 'package:shop_schedule/model/shop_schedule.dart';
import 'package:shop_schedule/view_model/shop_provider.dart';
import 'package:shop_schedule/widgets/base_app_bar.dart';
import 'package:shop_schedule/widgets/base_text.dart';
import 'package:shop_schedule/widgets/covert_open_time_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String getActiveSchedule(ShopSchedule data) {
    if (data.status.toString() == "1") {
      return "เปิด";
    } else {
      return "ปิด";
    }
  }

  Widget getScheduleText(ShopSchedule data) {
    var keyArrActive = [
      data.monday.toString(),
      data.tuesday.toString(),
      data.wednesday.toString(),
      data.thursday.toString(),
      data.friday.toString(),
      data.saturday.toString(),
      data.sunday.toString()
    ];
    var keyArr24Hr = [
      data.monday24hours.toString(),
      data.tuesday24hours.toString(),
      data.wednesday24hours.toString(),
      data.thursday24hours.toString(),
      data.friday24hours.toString(),
      data.saturday24hours.toString(),
      data.sunday24hours.toString()
    ];
    var keyArrFromTime = [
      data.mondayFromTime.toString(),
      data.tuesdayFromTime.toString(),
      data.wednesdayFromTime.toString(),
      data.thursdayFromTime.toString(),
      data.fridayFromTime.toString(),
      data.saturdayFromTime.toString(),
      data.sundayFromTime.toString()
    ];
    var keyArrToTime = [
      data.mondayToTime.toString(),
      data.tuesdayToTime.toString(),
      data.wednesdayToTime.toString(),
      data.thursdayToTime.toString(),
      data.fridayToTime.toString(),
      data.saturdayToTime.toString(),
      data.sundayToTime.toString()
    ];

    List<OpenTime> dayList = [];
    for (int i = 0; i < 7; i++) {
      var each = OpenTime(dayOfWeek: i);
      each.isActive = keyArrActive[i] == "1";
      each.is24Hr = keyArr24Hr[i] == "1";
      each.startTime = keyArrFromTime[i].substring(0, 5);
      each.endTime = keyArrToTime[i].substring(0, 5);
      dayList.add(each);
    }

    return ConvertOpenTimeText(
      dayList: dayList,
    );
  }

  Widget _cardScheduleInfo(ShopSchedule data, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () => context.push("/shop_schedule_edit"),
            child: Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Images.icTime,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const BaseText(
                          text: "เวลาเปิด - ปิด ร้านค้า",
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                        BaseText(
                          text: getActiveSchedule(data),
                          color: AppConstant.redColor,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          Images.icNext,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: getScheduleText(data),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BaseAppBar(
          titleText: "วันเวลาเปิด - ปิด ร้านค้า",
          isBack: false,
        ),
      ),
      body: Consumer<ShopProvider>(builder: (context, shop, child) {
        return _cardScheduleInfo(shop.schedule, context);
      }),
    );
  }
}
