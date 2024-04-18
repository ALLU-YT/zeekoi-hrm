import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchModel extends ChangeNotifier {
  final StopWatchTimer _stopWatchTimer =
      StopWatchTimer(mode: StopWatchMode.countUp);

  Stream<int> get rawTime => _stopWatchTimer.rawTime;

  get data => null;

  void startTimer() {
    _stopWatchTimer.onStartTimer();

    notifyListeners();
  }

  void disposeTimer() async {
    await _stopWatchTimer.dispose();
  }
}
