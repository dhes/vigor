import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNew extends FloatingActionButton {
  AddNew(this.addNew)
      : super(
            elevation: 10.0,
            backgroundColor: Get.theme.colorScheme.onPrimary,
            onPressed: addNew,
            child: Icon(
              Icons.add,
              color: Get.theme.colorScheme.primary,
            ));

  final Function addNew;
}
