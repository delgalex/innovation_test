import 'package:flutter/material.dart';
import 'package:innovation_test_application/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Journey',
      initialRoute: "login",
      //initialRoute: prefs.tokenSJ == "login" ? 'login': 'dashboard',
      //navigatorKey: navigatorKey, // Navegar 
      //scaffoldMessengerKey: , // snacks 
      routes: {
        'login'           : ( _ ) => LoginScreen(),
        'employeeList'    : ( _ ) => EmployeeList(),
        'employeeDetails' : ( _ ) => EmployeeDetails(),      
      }
    );
  }
}