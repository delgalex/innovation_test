
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static final PreferencesUser _instancia = PreferencesUser._internal();
 
  factory PreferencesUser() {
    return _instancia;
  }
  
  PreferencesUser._internal();

  late SharedPreferences _prefs;
  
  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  delPrefs()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();  
  }

  //GET and SET
  String get name {
    return _prefs.getString('name') ?? '';
  }

  set name( String value ) {
    _prefs.setString('name', value);
  }

  int get idUser {
    return _prefs.getInt('idUser') ?? 0;
  }

  set idUser( int value ) {
    _prefs.setInt('idUser', value);
  }

  int get photo {
    return _prefs.getInt('photo') ?? 0;
  }

  set photo( int value ) {
    _prefs.setInt('photo', value);
  }

}