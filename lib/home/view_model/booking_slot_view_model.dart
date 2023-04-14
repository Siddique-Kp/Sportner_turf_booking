import 'package:flutter/material.dart';

class BookingSlotViewModel with ChangeNotifier {
  BookingSlotViewModel() {
    DateTime now = DateTime.now();
    for (int i = 0; i < 5; i++) {
      _dates.add(now.add(Duration(days: i)));
    }
    _selectedDate = now;
  }

  DateTime? _selectedDate;
  final List<DateTime> _dates = [];
  String _selectedRadioButton = "";
  String _selectedTimeFrom = "HH:MM";
  String _selectedTimeTo = "HH:MM";

  DateTime? get selectedDate => _selectedDate;
  List<DateTime> get dates => _dates;
  String get selectedRadioButton => _selectedRadioButton;
  String get selectedTimeFrom => _selectedTimeFrom;
  String get selectedTimeTo => _selectedTimeTo;

  // Radio button controller -----------

  setRadioButton(String selectedButton) {
    _selectedRadioButton = selectedButton;
    notifyListeners();
  }

  // Date format controller ---------------

  setSelectedDate(DateTime? selectedDate) {
    _selectedDate = selectedDate;
    notifyListeners();
  }

  setDate(DateTime selectedDate) {
    _selectedDate = selectedDate;
    _dates.clear();
    for (int i = 0; i < 5; i++) {
      _dates.add(selectedDate.add(Duration(days: i)));
    }
    notifyListeners();
  }

  // Time slot controller ----------------

  setSelectedTimeFrom(String selectedTime) {
    _selectedTimeFrom = selectedTime;
    notifyListeners();
  }
  setSelectedTimeTo(String selectedTime) {
    _selectedTimeTo = selectedTime;
    notifyListeners();
  }
}
