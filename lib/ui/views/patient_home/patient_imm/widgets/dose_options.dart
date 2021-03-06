import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vigor/_internal/constants/dose_display.dart';
import 'package:vigor/_internal/utils/utils.dart';
import 'package:vigor/controllers/controllers.dart';

Widget doseOptions(
    Either<DoseDisplay, String> display, SizingInformation sizingInformation) {
  final screenSize = Get.put(ResponsiveCommand())!;

  return display.fold(
    (l) {
      switch (l) {
        case DoseDisplay.open:
          return Container();

        case DoseDisplay.due:
          return Container(
            alignment: Alignment.center,
            child: Icon(Icons.access_time,
                color: Colors.orange,
                size: screenSize.iconSizes(sizingInformation)),
          );

        case DoseDisplay.completedToday:
          return Container(
            alignment: Alignment.center,
            child: IconButton(
                color: Colors.yellow,
                icon: Icon(Icons.star_rate,
                    color: Colors.yellow,
                    size: screenSize.iconSizes(sizingInformation)),
                tooltip: dateFromDateTime(DateTime.now()),
                onPressed: () {}),
          );

        case DoseDisplay.overdue:
          return Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.warning,
                color: Colors.red,
                size: screenSize.iconSizes(sizingInformation),
              ));

        case DoseDisplay.na:
          return Center(child: Container(color: Colors.black));

        case DoseDisplay.possible:
          return Container();

        default:
          return Container();
      }
    },
    (r) => Container(
      alignment: Alignment.center,
      child: Icon(
        Icons.check_circle,
        color: Colors.green,
        size: screenSize.iconSizes(sizingInformation),
      ),
    ),
  );
}
