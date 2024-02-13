import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habit_hooked/core/constants/app_colors.dart';
import 'package:habit_hooked/core/constants/app_strings.dart';
import 'package:habit_hooked/core/utils/extensions.dart';
import 'package:habit_hooked/gen/assets.gen.dart';

import '../../../custom_package/calendar/lib/calendar.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<HomeScreenController>(builder: (ctrl) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.burger,
                      width: 27.w,
                      height: 16.w,
                      fit: BoxFit.contain,
                    ),
                    "24 Jan".appTextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.sp),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.filter,
                          width: 22.w,
                          height: 20.w,
                          fit: BoxFit.contain,
                        ).paddingOnly(right: 10.w),
                        SvgPicture.asset(
                          Assets.icons.moon,
                          width: 22.w,
                          height: 22.w,
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20.w, vertical: 20.w),
                Slidable(
                    key: UniqueKey(),
                    startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        extentRatio: 0.292,
                        children: [
                          SizedBox(width: 125.w, child: defaultSideData())
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // defaultBuildersss(),
                        // Container(child: Text("Habits Habits Habits Habits"),width: 100),

                        // Padding(
                        //   padding: const EdgeInsets.only(top: 0),
                        //   child:
                        //       SizedBox(width: 125.w, child: defaultBuildersss()),
                        // ),
                        Expanded(
                            child: SfCalendar(
                          view: CalendarView.week,
                          viewHeaderStyle: ViewHeaderStyle(
                              backgroundColor: greyColor,
                              dayTextStyle: getTextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                              dateTextStyle: getTextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600)),
                          selectionDecoration: BoxDecoration(color: Colors.red),
                          showNavigationArrow: true,
                          timeSlotViewSettings: TimeSlotViewSettings(
                              allDayPanelColor: Colors.transparent,
                              timeIntervalHeight: 57.w,
                              widget: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: SizedBox(
                                    width: 125.w, child: defaultBuildersss()),
                              ),
                              timeRulerSize: 100.w,
                              timeTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        )), /* TableCalendar(
                            focusedDay: DateTime.now(),
                            firstDay: DateTime(2010),
                            lastDay: DateTime(2050),
                            calendarFormat: CalendarFormat.week,
                            headerStyle: const HeaderStyle(
                              decoration: BoxDecoration(
                                color: Colors.red
                              ),

                            ),
                            daysOfWeekHeight: 32.w,

                            daysOfWeekStyle:  DaysOfWeekStyle(
                              weekdayStyle: getTextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),
                              weekendStyle: getTextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),
                              decoration: const BoxDecoration(
                                color: greyColor,
                              )
                            ),
                            headerVisible: false,
                            calendarStyle: const CalendarStyle(
                              cellMargin: EdgeInsets.zero,
                              cellPadding: EdgeInsets.zero,
                            ),
                            rowHeight: MediaQuery.of(context).size.height ,
                            onDaySelected: (selectedDay, focusedDay) {
                              defaultBuilder(selectedDay,
                                  selectedDate: selectedDay);
                            },
                            calendarBuilders: CalendarBuilders(
                                selectedBuilder: (context, day, focusedDay) {
                              return defaultBuilder(day,selectedDate: focusedDay);
                            }, defaultBuilder: (context, day, focusedDay) {
                              return defaultBuilder(day);
                            }, disabledBuilder: (context, day, focusedDay) {
                              return defaultBuilder(day);
                            }, outsideBuilder: (context, day, focusedDay) {
                              return defaultBuilder(day);
                            }, todayBuilder: (context, day, focusedDay) {
                              return defaultBuilder(day);
                            }),
                          )*/
                      ],
                    ))
              ],
            );
          }),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  Widget defaultBuilder(DateTime day, {DateTime? selectedDate}) {
    return Column(
      children: [
        Container(
            color: greyColor,
            height: 26.w,
            width: Get.width,
            child: day.day
                .toString()
                .appTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
        const Divider(color: dividerColor, height: 1),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: homeScreenController.entries.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // homeScreenController.isSelectedDate = index;
                  log('index---${selectedDate}');
                  if (selectedDate != null) {
                    homeScreenController.selectedEvent.add(SelectedEvent(
                        date: selectedDate,
                        event: homeScreenController.entries[index].toString()));
                    homeScreenController.update();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: const Border(
                          right: BorderSide(color: dividerColor),
                          bottom: BorderSide(color: dividerColor)),
                      color: homeScreenController.selectedEvent.contains(
                              SelectedEvent(
                                  date: selectedDate ?? DateTime.now(),
                                  event: homeScreenController.entries[index]
                                      .toString()))
                          ? Colors.black
                          : Colors.transparent),
                  height: 57.w,
                  width: double.infinity,
                  margin: const EdgeInsets.all(0),
                  child: Center(
                      child:
                          ((homeScreenController.entries.length - 1) != (index))
                              ? '${homeScreenController.entries[index]}'
                                  .appTextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp)
                              : '0'.appTextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp)),
                ),
              );
            }),
      ],
    );
  }

  Widget defaultBuildersss() {
    return Column(
      children: [
        Container(
            color: Colors.red,
            height: 58.w,
            child: Align(
                alignment: Alignment.center,
                child: habits.appTextStyle(
                    fontWeight: FontWeight.w600, fontSize: 20.sp))),
        const Divider(color: dividerColor, height: 1),
        ListView.builder(
            itemCount: homeScreenController.entries.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: dividerColor),
                        right: BorderSide(color: dividerColor))),
                height: 57.w,
                margin: const EdgeInsets.all(0),
                // color: Colors.green,
                child: Center(
                    child:
                        ((homeScreenController.entries.length - 1) != (index))
                            ? 'Entry ${homeScreenController.entries[index]}'
                                .appTextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp)
                            : Center(
                                child: Journal.appTextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp))),
              );
            }
            // Container(height: 50,width: double.infinity,color: Colors.red,margin: const EdgeInsets.all(1)),
            // Container(height: 50,width: double.infinity,color: Colors.yellow,margin: const EdgeInsets.all(1)),
            ),
      ],
    );
  }

  Widget defaultSideData() {
    return Column(
      children: [
        Container(color: greyColor, height: 58.w),
        const Divider(color: dividerColor, height: 1),
        ListView.builder(
            itemCount: homeScreenController.entries.length,
            // padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: dividerColor),
                        right: BorderSide(color: dividerColor))),
                height: 57.w,
                // margin: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 57.w,
                      child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(Assets.icons.edit)),
                    ),
                    Container(color: dividerColor, width: 1, height: 57.w),
                    SizedBox(
                      height: 57.w,
                      child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(Assets.icons.order)),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
