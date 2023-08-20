import 'package:flutter/material.dart';

class CourseNameProvider with ChangeNotifier {
  String courseName = 'Operation Research';

  void changeCourseName(String courseName) {
    courseName = courseName;
    notifyListeners();
  }
}
