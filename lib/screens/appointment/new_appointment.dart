import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:proj/screens/tab_screen.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../../data/appo_list.dart';
import '../../size_config.dart';

class NewAppointmentScreen extends StatefulWidget {
  Map<String, dynamic> hospitalDetailData;
  NewAppointmentScreen({
    required this.hospitalDetailData,
    Key? key,
  }) : super(key: key);

  @override
  State<NewAppointmentScreen> createState() => NewAppointmentScreenState();
}

class NewAppointmentScreenState extends State<NewAppointmentScreen> {
  User userData = FirebaseAuth.instance.currentUser!;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  DateTime _selectedDay = DateTime.now();
  TimeOfDay _selectedTime = const TimeOfDay(hour: 12, minute: 00);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    String date = DateFormat().add_yMMMd().format(_selectedDay);
    String time = _selectedTime.format(context);
    final providerOfAppointmentList =
        Provider.of<AppointmentList>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        titleTextStyle:
            Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Appointment for ${widget.hospitalDetailData["name"]}',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      key: _scaffoldkey,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              focusedDay: _selectedDay,
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green[400],
                ),
                todayTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                selectedTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              headerStyle: const HeaderStyle(formatButtonVisible: false),
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              onDaySelected: (pickedDate, events) {
                setState(() {
                  _selectedDay = pickedDate;
                  date = DateFormat().add_yMMMd().format(_selectedDay);
                });
              },
            ),
            Container(
              alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              margin: (width <= 550)
                  ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                  : const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: TextButton(
                onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    initialEntryMode: TimePickerEntryMode.dial,
                    context: context,
                    initialTime: _selectedTime,
                  );
                  if (newTime == null) return;
                  setState(() {
                    _selectedTime = newTime;
                    time = _selectedTime.format(context);
                  });
                  print(_selectedTime);
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: Text('Date: $date\nTime: $time'),
                      actions: [
                        TextButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('YES'),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await providerOfAppointmentList.addData(
                                date, time, widget.hospitalDetailData);
                            _scaffoldkey.currentState!.showSnackBar(
                              const SnackBar(
                                content: Text('Appoinment Added.'),
                                duration: Duration(seconds: 2),
                                // action: SnackBarAction(
                                //   label: 'View',
                                //   onPressed: () {
                                //     Navigator.of(context).pop();
                                //     Navigator.of(context).pushAndRemoveUntil(
                                //         MaterialPageRoute(
                                //             builder: ((context) =>
                                //                 TabScreen(2))),
                                //         (route) => false);
                                //   },
                                // ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'NEXT',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Appointments',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: ((context) => TabScreen(2)),
                          ),
                          (route) => false);
                    },
                    icon: const Icon(Icons.double_arrow_rounded)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
