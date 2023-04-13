import 'package:flutter/material.dart';

class BookingSlotViewModel with ChangeNotifier {
  DateTime? selectedInitialDate;
  final List<DateTime> _dates = [];

  // DateTime? get selectedDate => selectedInitialDate;
  List<DateTime> get dates => _dates;

  setSelectedDate(DateTime? selectedDate) {
    selectedInitialDate = selectedDate;
    notifyListeners();
  }

  setDate(DateTime selectedDate) {
    selectedInitialDate = selectedDate;
    _dates.clear();
    for (int i = 0; i < 5; i++) {
      _dates.add(selectedDate.add(Duration(days: i)));
    }
    notifyListeners();
  }
}
