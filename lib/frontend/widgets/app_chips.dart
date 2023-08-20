import 'package:flutter/material.dart';
import 'package:knustforum/frontend/providers/course_name_provider.dart';
import 'package:knustforum/frontend/widgets/small_text.dart';
import 'package:provider/provider.dart';

class AppChip extends StatelessWidget {
  final String courseName;
  const AppChip({Key? key, required this.courseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CourseNameProvider>().changeCourseName(courseName);
      },
      child: Chip(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Set the border radius
          side: BorderSide(
              color: Colors.black, width: 1), // Set the border color and width
        ),
        label: AppSmallText(
          text: courseName,
          color: Colors.black,
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
