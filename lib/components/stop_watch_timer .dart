import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:transportation2/components/custom_button.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/firebase/logic.dart';

class CustomStopWatchTimer extends StatefulWidget {
  final String email;

  CustomStopWatchTimer({Key key, this.email}) : super(key: key);

  @override
  _CustomStopWatchTimerState createState() => _CustomStopWatchTimerState();
}

class _CustomStopWatchTimerState extends State<CustomStopWatchTimer> {
  final _isHours = true;
  DateTime startTime;
  DateTime endTime;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    isLapHours: true,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, hours: _isHours);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        displayTime,
                        style: const TextStyle(
                            fontSize: 40,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        value.toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          /// Display every minute.
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.minuteTime,
              initialData: _stopWatchTimer.minuteTime.value,
              builder: (context, snap) {
                final value = snap.data;
                return Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                'minute',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                value.toString(),
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                  ],
                );
              },
            ),
          ),

          /// Display every second.
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.secondTime,
              initialData: _stopWatchTimer.secondTime.value,
              builder: (context, snap) {
                final value = snap.data;
                return Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                'second',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                value.toString(),
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                );
              },
            ),
          ),

          /// Button
          Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(4),
                          color: AppColors.blue,
                          shape: const StadiumBorder(),
                          onPressed: () async {
                            DateTime now = DateTime.now();
                            startTime = new DateTime(now.year, now.month,
                                now.day, now.hour, now.minute);
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
                          },
                          child: const Text(
                            'Start',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screen_height * 0.04,
          ),
          endTime != null
              ? Column(
                  children: [
                    Container(
                      child: Text(
                        "Ваше послдение время сна:",
                        style: TextStyle(
                          fontSize: screen_height * 0.025,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screen_height * 0.005,
                    ),
                    Text('${startTime} - $endTime',
                      style: TextStyle(
                        fontSize: screen_height * 0.02,
                      ),),
                    SizedBox(
                      height: screen_height * 0.04,
                    ),
                  ],
                )
              : SizedBox(),
          CustomButton(
            onTap: _saveSleepTime,
            buttonName: "Add Sleep Time",
          )
        ],
      ),
    );
  }

  _saveSleepTime() {
    DateTime now = DateTime.now();
    endTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute);
    print(endTime);
    print(_convertTimeToHours(_stopWatchTimer.rawTime.value));
    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    setState(() {}); //FirebaseLogic.addSleepInfoForDriver(widget.email);
  }

  double _convertTimeToHours(int ms) {
    return ms * 0.000016666666666666667 / 60;
  }
}
