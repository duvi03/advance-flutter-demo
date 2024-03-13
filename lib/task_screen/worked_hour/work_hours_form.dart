import 'package:demo/core/constant/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkHoursTracker extends StatelessWidget {
  const WorkHoursTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Hours Tracker'),
      ),
      body: WorkHoursForm(),
    );
  }
}

class WorkHoursForm extends StatefulWidget {
  const WorkHoursForm({super.key});

  @override
  State<WorkHoursForm> createState() => _WorkHoursFormState();
}

class _WorkHoursFormState extends State<WorkHoursForm> {
  List<double> dailyWorkingHours = [];
  int numberOfWorkingDays = 22;
  double? totalWorkingHours;

  // Adjust this based on the actual number of working days in the month

  @override
  void initState() {
    super.initState();
    loadStoredData();
  }

  Future<void> loadStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dailyWorkingHours = List.generate(
        numberOfWorkingDays,
        (index) => prefs.getDouble('day_$index') ?? 0.0,
      );
    });
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < dailyWorkingHours.length; i++) {
      prefs.setDouble('day_$i', dailyWorkingHours[i] ?? 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: numberOfWorkingDays,
            separatorBuilder: (context, index) {
              return SizedBox(height: 12.sp);
            },
            itemBuilder: (context, index) {
              int day = index + 1;
              return SizedBox(
                // height: 60.sp,
                width: double.infinity,
                // color: Colors.tealAccent,
                child: ListTile(
                  title: Container(
                    height: 50.sp,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.tealAccent),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                          child: Column(
                            children: [
                              const Text('Day'),
                              Text('$day'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  trailing: ConstrainedBox(
                    constraints: BoxConstraints(
                      /// Just an example, but this makes sure, that since you set a fixed width like 300.0, on small screens this won't get too big. For example by setting a maxWidth constraint like this, its width will be 300.0, but at max as big as 1 / 3 of the screen width so it gets smaller on small screen sizes
                      maxWidth: MediaQuery.of(context).size.width / 1.4,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Hours'),
                        onChanged: (value) {
                          try {
                            double hours = double.parse(value);
                            setState(() {
                              dailyWorkingHours[index] = hours;
                            });
                          } catch (e) {
                            // Handle invalid input
                          }
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (totalWorkingHours != null) ...[
          SizedBox(height: 20.sp),
          Text('Total working hours for the month: $totalWorkingHours'),
          SizedBox(height: 20.sp),
        ],
        ElevatedButton(
          onPressed: () async {
            await saveData();
            totalWorkingHours = calculateTotalHours();
            // Display the total working hours (you can use a dialog or another widget)
            print('Total working hours for the month: $totalWorkingHours');
          },
          child: Text('Calculate Total Hours'),
        ),
        SizedBox(
          height: 50.sp,
        )
      ],
    );
  }

  double calculateTotalHours() {
    double totalHours = dailyWorkingHours.reduce((value, element) => value + (element));
    return totalHours;
  }
}
