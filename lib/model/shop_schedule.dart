class ShopSchedule {
  String status;
  String monday;
  String monday24hours;
  String mondayFromTime;
  String mondayToTime;
  String tuesday;
  String tuesday24hours;
  String tuesdayFromTime;
  String tuesdayToTime;
  String wednesday;
  String wednesday24hours;
  String wednesdayFromTime;
  String wednesdayToTime;
  String thursday;
  String thursday24hours;
  String thursdayFromTime;
  String thursdayToTime;
  String friday;
  String friday24hours;
  String fridayFromTime;
  String fridayToTime;
  String saturday;
  String saturday24hours;
  String saturdayFromTime;
  String saturdayToTime;
  String sunday;
  String sunday24hours;
  String sundayFromTime;
  String sundayToTime;

  ShopSchedule({
    this.status = "0",
    this.monday = "0",
    this.monday24hours = "0",
    this.mondayFromTime = "00:00",
    this.mondayToTime = "23:59",
    this.tuesday = "0",
    this.tuesday24hours = "0",
    this.tuesdayFromTime = "00:00",
    this.tuesdayToTime = "23:59",
    this.wednesday = "0",
    this.wednesday24hours = "0",
    this.wednesdayFromTime = "00:00",
    this.wednesdayToTime = "23:59",
    this.thursday = "0",
    this.thursday24hours = "0",
    this.thursdayFromTime = "00:00",
    this.thursdayToTime = "23:59",
    this.friday = "0",
    this.friday24hours = "0",
    this.fridayFromTime = "00:00",
    this.fridayToTime = "23:59",
    this.saturday = "0",
    this.saturday24hours = "0",
    this.saturdayFromTime = "00:00",
    this.saturdayToTime = "23:59",
    this.sunday = "0",
    this.sunday24hours = "0",
    this.sundayFromTime = "00:00",
    this.sundayToTime = "23:59",
  });
}

class OpenTime {
  int dayOfWeek;
  String timeStr = "";

  bool isActive = false;
  bool is24Hr = false;
  String startTime = "00:00";
  String endTime = "23:59";

  OpenTime({required this.dayOfWeek, this.timeStr = ""});
}
