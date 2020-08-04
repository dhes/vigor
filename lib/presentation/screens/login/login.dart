import 'package:fhir/fhir_r4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigor/infrastructure/fhir_db/fhir_db.dart';
import 'package:vigor/infrastructure/fhir_db/resource_dao.dart';

import '../../localization/translate.dart';
import '../../shared/shared.dart';

import 'by_country.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    callDb();
  }

  void callDb() async {
    await FhirDb.instance.database;
    Patient patient = Patient(
      resourceType: 'Patient',
      name: [HumanName(family: 'Faulkenberry')],
      id: Id('vigor-373424755-744714029'),
    );
    ResourceDao resourceDao = ResourceDao();
    // print(patient.toJson());
    await resourceDao.save(patient);
    List<Resource> patients =
        await resourceDao.getAllSortedById(resourceType: 'Patient');
    patients.forEach((patient) => print(patient.toJson()));
    List<Resource> history =
        await resourceDao.getAllSortedById(resourceType: '_history');
    history.forEach((patient) => print(patient.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vigor')),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                flagContainer(country, MediaQuery.of(context).size),
                splashText(country),
                SizedBox(height: 30.0),
                loginField(translateString(context, 'Username'), false),
                SizedBox(height: 15.0),
                loginField(translateString(context, 'Password'), true),
                SizedBox(height: 15.0),
                loginButton(
                  translateString(context, 'Login'),
                  MediaQuery.of(context).size,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// const String country = 'botswana';
// const String country = 'dominican_republic';
const String country = 'usa';

TextField loginField(String hint, bool obscure) => TextField(
      obscureText: obscure,
      decoration: InputDecoration(
          contentPadding: padding,
          hintText: hint,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

Material loginButton(String login, Size size) => Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(64.0),
      color: Colors.blue[600],
      child: MaterialButton(
        minWidth: size.width,
        padding: padding,
        onPressed: () => Get.to(HomeScreen()),
        child: Text(login, textAlign: TextAlign.center),
      ),
    );

EdgeInsetsGeometry padding = EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0);
