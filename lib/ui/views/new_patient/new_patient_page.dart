import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigor/ui/styled_components/thin_action_button.dart';

import '../../../controllers/local/new_patient/new_patient_controller.dart';
import '../../styled_components/app_bar.dart';
import '../../styled_components/bottom_navigation_bar.dart';
import 'widgets/barrio.dart';
import 'widgets/birthDate.dart';
import 'widgets/gender.dart';
import 'widgets/names.dart';

class NewPatientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewPatientController());

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar:
            VigorAppBar(title: controller.labels.general.patientInformation),
        body: Padding(
          padding: EdgeInsets.all(Get.width / 10),
          child: Center(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  /// reusable widget for entering first and last names, is
                  /// passed 2 text controllers, and the error messages for each
                  NamesInputWidget(
                    familyName: controller.familyName,
                    givenName: controller.givenName,
                    familyNameError: controller.familyNameError,
                    givenNameError: controller.givenNameError,
                  ),

                  /// reusable widget for entering gender at birth, is passed a
                  /// boolean (true = female, false = male), and then the
                  /// controller function to change it
                  GenderSelectionWidget(
                    curGender: controller.gender,
                    setGender: controller.genderEvent,
                    genderError: controller.genderError,
                  ),

                  /// reusable widget for entering birthdate, arguments are
                  /// controller function to choose birthdate, the current
                  /// birthdate, the birthdate as a String, and then an error
                  /// message
                  BirthDateWidget(
                    date: controller.date,
                    chooseBirthDate: controller.chooseBirthDate,
                    displayBirthDate: controller.displayBirthDate,
                    dispBirthDateError: controller.birthDateError,
                  ),

                  /// reusable widget for selecting neighborhood, includes the
                  /// list of neighborhoods, which one to display, the event
                  /// to change it, and the error message
                  BarrioWidget(
                    barriosList: controller.barriosList,
                    displayBarrio: controller.barrio,
                    setBarrio: controller.barrioEvent,
                    dispBarrioError: controller.barrioError,
                  ),

                  /// button to register patient
                  ThinActionButton(
                    buttonText: controller.labels.general.nextPage,
                    onPressed: () => controller.registerEvent(),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomAppBar,
      ),
    );
  }
}