import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:innovation_test_application/preferences/preferences_user.dart';

class LoginService extends ChangeNotifier {
  final prefs = PreferencesUser();
  
  final String _baseUrl = 'dummy.restapiexample.com';

  Future<String?> login( String id) async{

    final url = Uri.https(_baseUrl, 'api/v1/employee/$id');
   print(url);
    final resp = await http.get( url );
    Map<String, dynamic> decodedResp = json.decode( resp.body );
    
    if( decodedResp['status'] == 'success' ){      
      prefs.idUser = decodedResp['data']['id'];
      prefs.name = decodedResp['data']['employee_name'];
      return null;
    }else{
      print("I have a problem whith a login");
      return("error");
    }
  
  }

}