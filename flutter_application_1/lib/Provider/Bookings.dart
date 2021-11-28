import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/list_car_screen.dart';

class bookings with ChangeNotifier {
  List<ListCar> _bookings = [];

  List<ListCar> get Bookings {
    return [..._bookings];
  }

  void addBookings() {
    // _item.add(value);
    notifyListeners();
  }
}
