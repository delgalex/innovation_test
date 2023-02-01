import 'package:flutter/material.dart';
import 'package:innovation_test_application/pages/pages.dart';
import 'package:innovation_test_application/preferences/preferences_user.dart';
import 'package:innovation_test_application/providers/service_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferencesUser();
  await prefs.initPrefs();
  runApp(LoadProviders());
} 

class LoadProviders extends StatefulWidget {
  const LoadProviders({Key? key}) : super(key: key);

  @override
  State<LoadProviders> createState() => _LoadProvidersState();
}
 
class _LoadProvidersState extends State<LoadProviders> {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ServiceProvider(), lazy: false),        
      ],
      child: MyApp(),
    );
  }
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
      },

      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF123f60),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF123f60),
          elevation: 0
        )
      ), 

    );
  }
}