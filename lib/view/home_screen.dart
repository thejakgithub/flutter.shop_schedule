import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_schedule/constants/images.dart';
import 'package:shop_schedule/model/shop_schedule.dart';
import 'package:shop_schedule/view_model/shop_provider.dart';
import 'package:shop_schedule/widgets/base_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String getActiveSchedule(BranchProvider branchData) {
  //   if (!branchData.loading) {
  //     if (branchData.data.schedule != null) {
  //       if (branchData.data.schedule!.status.toString() == "1") {
  //         return "เปิด";
  //       } else {
  //         return "ปิด";
  //       }
  //     } else {
  //       return "";
  //     }
  //   } else {
  //     return "";
  //   }
  // }

  //  Widget getScheduleText(BranchProvider branchData) {
  //   // this is section where we convert data in to model
  //   if (!branchData.loading) {
  //     if (branchData.data.schedule != null) {
  //       //need to change this array due to key in each api u make model
  //       // our api is not return good same result for us need to be this way
  //       var keyArrActive = [
  //         branchData.data.schedule!.monday.toString(),
  //         branchData.data.schedule!.tuesday.toString(),
  //         branchData.data.schedule!.wednesday.toString(),
  //         branchData.data.schedule!.thursday.toString(),
  //         branchData.data.schedule!.friday.toString(),
  //         branchData.data.schedule!.saturday.toString(),
  //         branchData.data.schedule!.sunday.toString()
  //       ];
  //       var keyArr24Hr = [
  //         branchData.data.schedule!.monday24hours.toString(),
  //         branchData.data.schedule!.tuesday24hours.toString(),
  //         branchData.data.schedule!.wednesday24hours.toString(),
  //         branchData.data.schedule!.thursday24hours.toString(),
  //         branchData.data.schedule!.friday24hours.toString(),
  //         branchData.data.schedule!.saturday24hours.toString(),
  //         branchData.data.schedule!.sunday24hours.toString()
  //       ];
  //       var keyArrFromTime = [
  //         branchData.data.schedule!.mondayFromtime.toString(),
  //         branchData.data.schedule!.tuesdayFromtime.toString(),
  //         branchData.data.schedule!.wednesdayFromtime.toString(),
  //         branchData.data.schedule!.thursdayFromtime.toString(),
  //         branchData.data.schedule!.fridayFromtime.toString(),
  //         branchData.data.schedule!.saturdayFromtime.toString(),
  //         branchData.data.schedule!.sundayFromtime.toString()
  //       ];
  //       var keyArrToTime = [
  //         branchData.data.schedule!.mondayTotime.toString(),
  //         branchData.data.schedule!.tuesdayTotime.toString(),
  //         branchData.data.schedule!.wednesdayTotime.toString(),
  //         branchData.data.schedule!.thursdayTotime.toString(),
  //         branchData.data.schedule!.fridayTotime.toString(),
  //         branchData.data.schedule!.saturdayTotime.toString(),
  //         branchData.data.schedule!.sundayTotime.toString()
  //       ];

  //       if (branchData.data.schedule!.scheduleType == "24hr") {
  //         return const BaseText(
  //           text: "เปิดตลอด 24 ชั่วโมง",
  //           fontWeight: FontWeight.w500,
  //           color: Color(0xff676A6F),
  //         );
  //       } else {
  //         List<OpenTime> dayList = [];
  //         for (int i = 0; i < 7; i++) {
  //           var each = OpenTime(dayOfWeek: i);
  //           each.isActive = keyArrActive[i] == "1";
  //           each.is24Hr = keyArr24Hr[i] == "1";
  //           each.startTime = keyArrFromTime[i].substring(0, 5);
  //           each.endTime = keyArrToTime[i].substring(0, 5);
  //           dayList.add(each);
  //         }

  //         return Helper().convertOpenTimeTxt(dayList);
  //       }
  //     }
  //   }

  //   return Container();
  // }

  Widget _customDivider() {
    return const Divider(
      color: Color(0xffEFEFEF),
      indent: 15,
      endIndent: 15,
      height: 1,
    );
  }

  Widget _cardScheduleInfo(ShopSchedule data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              child: Column(
                children: [
                  SvgPicture.asset(
                    Images.icTime,
                  ),
                ],
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
          titleText: "วันเวลาเปิด-ปิดร้านค้า",
          isBack: false,
        ),
      ),
      body: Consumer<ShopProvider>(builder: (context, shop, child) {
        return _cardScheduleInfo(shop.schedule);
      }),
    );
  }
}
