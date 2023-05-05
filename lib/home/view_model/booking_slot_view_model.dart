import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sporter_turf_booking/home/view_model/venue_details_view_model.dart';

class BookingSlotViewModel with ChangeNotifier {
  BookingSlotViewModel() {
    DateTime now = DateTime.now();
    for (int i = 0; i < 5; i++) {
      _dates.add(now.add(Duration(days: i)));
    }
    _selectedDate = now;
  }

  final venueViewMode = VenueDetailsViewModel();

  int _selectedSport = -1;
  DateTime? _selectedDate;
  final List<DateTime> _dates = [];
  String _selectedRadioButton = "";
  String _facility = "";
  String _selectedTime = "HH:MM";

  int get selectedSport => _selectedSport;
  DateTime? get selectedDate => _selectedDate;
  List<DateTime> get dates => _dates;
  String get selectedRadioButton => _selectedRadioButton;
  String get facility => _facility;
  String get selectedTime => _selectedTime;

  // Selected sport controller ---------

  setSelectedSport(int index, String facility) {
    _selectedSport = index;
    _facility = facility;
    clearRadioValue();
    notifyListeners();
  }

  // Radio button controller -----------

  setRadioButton(String selectedButton) {
    _selectedRadioButton = selectedButton;
    notifyListeners();
  }

  clearRadioValue() {
    _selectedRadioButton = "";
  }

  // Date format controller ---------------

  setSelectedDate(DateTime? selectedDate) {
    _selectedDate = selectedDate;
    clearSelectedTime();
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

  setSelectedTime(String selectedTime) {
    _selectedTime = selectedTime;
    notifyListeners();
  }

  clearSelectedTime() {
    _selectedTime = "HH:MM";
  }

  // CHECK SELECTED ALL FACILITY NEEDED

  checkBookingSelection() {
    if (_selectedDate == null ||
        _facility == "" ||
        _selectedRadioButton == "" ||
        _selectedSport == -1 ||
        _selectedTime == "HH:MM") {
      return false;
    }

    return true;
  }

  // Convert to 12 hours
  String convertTo12HourFormat(String time24) {
    if (time24 == "HH:MM") {
      return time24;
    }
    DateTime time = DateFormat('HH:mm').parse(time24);

    String time12 = DateFormat('h:mm a').format(time);

    return time12;
  }
}
