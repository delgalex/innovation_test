import 'dart:convert';
import 'employee.dart';

class EmployeeResponse {

    EmployeeResponse({
        required this.status,
        required this.data,
    });

    String status;
    List<Employee> data;

    factory EmployeeResponse.fromJson(String str) => EmployeeResponse.fromMap(json.decode(str));

    factory EmployeeResponse.fromMap(Map<String, dynamic> json) => EmployeeResponse(
        status: json["status"],
        data: List<Employee>.from(json["data"].map((x) => Employee.fromMap(x))),
    );

}

