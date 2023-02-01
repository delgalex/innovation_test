import 'package:flutter/material.dart';
import 'package:innovation_test_application/pages/pages.dart';
import 'package:innovation_test_application/preferences/preferences_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferencesUser();
  await prefs.initPrefs();
  runApp(MyApp());
} 


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Journey',
      initialRoute: "employeeList",
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