import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  final List<int> entries = <int>[1, 2, 3, 4];
List<SelectedEvent> selectedEvent=[];
  int isSelectedDate = 0;
}
class SelectedEvent{
  DateTime date;
  String event;
  SelectedEvent({required this.date,required this.event});
}