import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/appo_list.dart';

class UserAppointmentScreen extends StatefulWidget {
  const UserAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<UserAppointmentScreen> createState() => _UserAppointmentScreenState();
}

class _UserAppointmentScreenState extends State<UserAppointmentScreen> {
  // Future? tmp;

  // @override
  // void initState() {
  //   super.initState();
  //   tmp=Provider.of<AppointmentList>(context).getData();
  // }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<AppointmentList>(context, listen: false)
            .fetchData(), //tmp,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Your Appointments'),
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          }
          List yourAppo = Provider.of<AppointmentList>(context)
              .appointmentList
              .reversed
              .toList();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Your Appointments'),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: yourAppo.isEmpty
                ? LayoutBuilder(builder: ((context, constraints) {
                    return Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'No Appointments added yet!',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.6,
                            child: Image.asset(
                              'assets/images/waiting.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
                : ListView.builder(
                    itemCount:
                        Provider.of<AppointmentList>(context, listen: false)
                            .getLength,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        leading:
                            const CircleAvatar(),
                        title: Text(yourAppo[index]['hospitalDetail']['name']),
                        subtitle: Text(yourAppo[index]['date'] +
                            '  ' +
                            yourAppo[index]['time']),
                      );
                    }),
                  ),
          );
        });
  }
}
/* 
Future<List>? yourAppo ;
  @override
  void initState() {
    super.initState();
    yourAppo=Provider.of<AppointmentList>(context).appointmentList;
  }
*/