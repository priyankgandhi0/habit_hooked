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
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

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
                    Row(
                      children: [
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            ctrl.pageController?.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );

                            // ctrl.focusedDay = ctrl.focusedDay.subtract(const Duration(days: 7));
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.black,
                          ),
                        ),
                        ctrl.headerText.appTextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            ctrl.pageController?.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                            // ctrl.focusedDay = ctrl.focusedDay.add(const Duration(days: 7));
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
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
                        Padding(
                          padding: EdgeInsets.only(top: 0.w),
                          child: SizedBox(
                              width: 100.w, child: defaultBuildersss()),
                        ),
                        Expanded(
                          child: TableCalendar(
                            focusedDay: DateTime.now(),
                            firstDay: DateTime(2010),
                            lastDay: DateTime(2050),
                            calendarFormat: CalendarFormat.week,
                            headerVisible: false,
                            rowHeight: 345.w,
                            daysOfWeekVisible: false,
                            onCalendarCreated: (controller) {
                              ctrl.pageController = controller;
                            },
                            calendarBuilders: CalendarBuilders(
                              defaultBuilder: (context, day, focusedDay) {
                                ctrl.headerText =
                                    DateFormat.MMMM().format(focusedDay);

                                return defaultBuilder(day,
                                    selectedDate: focusedDay);
                              },
                              todayBuilder: (context, day, focusedDay) {
                                return defaultBuilder(day,
                                    selectedDate: focusedDay);
                              },
                              disabledBuilder: (context, day, focusedDay) {
                                return defaultBuilder(day,
                                    selectedDate: focusedDay);
                              },
                              selectedBuilder: (context, day, focusedDay) {
                                return defaultBuilder(day,
                                    selectedDate: focusedDay);
                              },
                              outsideBuilder: (context, day, focusedDay) {
                                return defaultBuilder(day,
                                    selectedDate: focusedDay);
                              },

                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget defaultBuilder(DateTime day, {required DateTime selectedDate}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            color: greyColor,
            height: 58.w,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DateFormat('EEE')
                          .format(day)
                          .toUpperCase()
                          .toString()
                          .appTextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                      day.day.toString().appTextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ],
                  ),
                ),
                Container(
                  color: dividerColor,
                  width: 1,
                )
              ],
            )),
        const Divider(color: dividerColor, height: 1),
        Table(
          defaultColumnWidth: FlexColumnWidth(
            58.w
          ),
          border: TableBorder.all(color: dividerColor, width: 1),
          children: List.generate(
            homeScreenController.entries.length,
            (rowIndex) {

            return  TableRow(
                children: [
                  TableCell(
                    child: GestureDetector(
                      onTap: () {
                        int index = homeScreenController.selectedCell.indexWhere(
                                (element) =>
                            element.rowIndex == rowIndex &&
                                element.colIndex == day &&
                                element.isSelected == 0);
                        int secondIndex = homeScreenController.selectedCell
                            .indexWhere((element) =>
                        element.rowIndex == rowIndex &&
                            element.colIndex == day &&
                            element.isSelected == 1);
                        if (index >= 0) {
                          homeScreenController.selectedCell[index].isSelected = 1;
                        } else if (secondIndex >= 0) {
                          homeScreenController.selectedCell.removeAt(secondIndex);
                        } else {
                          homeScreenController.selectedCell.add(SelectedEvent(
                              rowIndex: rowIndex, colIndex: day, isSelected: 0));
                        }

                        homeScreenController.update();
                      },
                      onLongPress: () {
                        log('HOLD EVENT ');
                      },
                      child: rowIndex == 4
                          ? SizedBox(
                        width: 57.w,
                        height: 57.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.icons.journal,
                                height: 20.w,
                                width: 15.w,
                                fit: BoxFit.contain),
                          ],
                        ),
                      )
                          : Container(
                        width: 57.w,
                        height: 57.w,
                        color: homeScreenController.selectedCell.indexWhere(
                                (element) =>
                            element.rowIndex == rowIndex &&
                                element.colIndex == day &&
                                element.isSelected == 0) >=
                            0
                            ? Colors.green
                            : homeScreenController.selectedCell.indexWhere(
                                (element) =>
                            element.rowIndex == rowIndex &&
                                element.colIndex == day &&
                                element.isSelected == 1) >=
                            0
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ),
                  )
                ],
              );
            }
          ),
        )
      ],
    );
  }

  Widget defaultBuildersss() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                  color: greyColor,
                  height: 58.w,
                  child: Align(
                      alignment: Alignment.center,
                      child: habits.appTextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.sp))),
            ),
            Container(
              color: dividerColor,
              width: 2,
              height: 58.w,
            )
          ],
        ),
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
                child: Center(
                    child:
                        ((homeScreenController.entries.length - 1) != (index))
                            ? homeScreenController.entries[index].appTextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16.sp)
                            : Center(
                                child: Journal.appTextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp))),
              );
            }),
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
                          child: SvgPicture.asset(
                            Assets.icons.edit,
                            color: index == 4 ? Colors.transparent : blueColor,
                          )),
                    ),
                    Container(color: dividerColor, width: 1, height: 57.w),
                    SizedBox(
                      height: 57.w,
                      child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(Assets.icons.order,
                              color:
                                  index == 4 ? Colors.transparent : blueColor)),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
