import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final List<String> entries = <String>[
    "Running Everyday",
    "Going to Gym",
    "Go for a walk with the dog",
    "Running Everyday",
    "Going to Gym",
  ];
  PageController? pageController;
  String _headerText='';

  String get headerText => _headerText;

  set headerText(String value) {
    _headerText = value;
    // update();
  }
  List<CalendarData> calendarData=[];





  DateTime focusedDay = DateTime.now();
  List<SelectedEvent> selectedCell=[];
}
class SelectedEvent{
  int rowIndex;
  DateTime colIndex;
  int isSelected;

  SelectedEvent({required this.rowIndex,required this.colIndex,required this.isSelected});
}

class CalendarData{
  String title;
  String list;
  CalendarData({required this.list,required this.title});
}