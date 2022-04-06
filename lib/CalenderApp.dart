import 'package:flutter/material.dart';
import "package:flutter_clean_calendar/flutter_clean_calendar.dart";

class CalenderApp extends StatefulWidget {
  const CalenderApp({Key? key}) : super(key: key);

  @override
  State<CalenderApp> createState() => _CalenderAppState();
}

class _CalenderAppState extends State<CalenderApp> {
  DateTime selectedDay = DateTime.now();
  late List<CleanCalendarEvent> selectedEvent;
  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Event',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Special Event',
          color: Colors.blue),
    ],
  };

  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
  }

  @override
  void initState() {
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Attendence'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        child: Calendar(
          startOnMonday: true,
          selectedColor: Colors.blue,
          todayColor: Colors.red,
          eventColor: Colors.green,
          eventDoneColor: Colors.amber,
          bottomBarColor: Colors.deepOrange,
          onRangeSelected: (range) {
            print('selected Day ${range.from}, ${range.to}');
          },
          onDateSelected: (date) {
            return _handleData(date);
          },
          events: events,
          isExpanded: true,
          dayOfWeekStyle: TextStyle(
            fontSize: 15,
            color: Colors.black12,
            fontWeight: FontWeight.w100,
          ),
          bottomBarTextStyle: TextStyle(
            color: Colors.white,
          ),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        ),
      )),
    );
  }
}
