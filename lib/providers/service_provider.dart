import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innovation_test_application/models/employee.dart';

import '../models/employee_response.dart';

class ServiceProvider extends ChangeNotifier{
  
  List<Employee> showEmployee = [];
  final String _baseUrl = 'dummy.restapiexample.com';

  getEmployees() async{
    var url = Uri.https(_baseUrl, 'api/v1/employees');
    
    final response = await http.get(url);

    /*  // no cargo la respuesta del API porque manda una pàgina WEB
    final Map<String, dynamic> decodificado = json.decode( response.body );
   
    if(decodificado['status'] == 'succes'){
      final employeeResponse = EmployeeResponse.fromJson(response.body);
      showEmployee = employeeResponse.data;
      notifyListeners();
    }else{
      print("No data");
    }
    */




  }

}