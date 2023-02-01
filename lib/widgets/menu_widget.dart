import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innovation_test_application/preferences/preferences_user.dart';

import '../utils/utils.dart';

class MenuWidget extends StatelessWidget {
  final prefs = PreferencesUser();
  
  static const IconData solecito = IconData(0xf0d1, fontFamily: 'MaterialIcons');

  MenuWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {   
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Expanded(child: 
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/menu-img.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: _userInfo(),
            ),
          ),

          const Divider(height: 15.0,),
         
          ListTile(
            leading: const Icon( Icons.people, color: Colors.cyan),
            title: const Text(
                        'Lista de Empleados',
                          style: TextStyle(
                             fontSize: 16.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.black,
                          )  
                       ),
            onTap: (){
              Navigator.pushReplacementNamed(context, "employeeList");
            },
          ),


          ListTile(
            leading: const Icon( Icons.exit_to_app, color: Colors.cyan),
            title: const Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          )  
                       ),
            onTap: (){
              prefs.delPrefs();
              mostrarAlerta( context, "Tu sessión ha cerrado correctamente. ¡Te esperamos!", "Hasta pronto" );
              Future.delayed(const Duration(milliseconds: 2000), () {
                exit(0);
              });

            },
          ),

         
        ],
      ), 
    );

  }


  Widget _userInfo(){
    
    final foto = Container(
      width: 90.0,
      height: 90.0,
      margin: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.00),
        child: Container(

            child: ( prefs.photo > 1 ) 
              ? FadeInImage(
                  placeholder: const AssetImage( 'assets/images/loading.gif' ), 
                  image: NetworkImage('https://sige.cenca.edu.mx/images/alumnos/'+prefs.idUser.toString()+'.jpg')
                )
              : const Image( image: AssetImage('assets/images/avatar.png'), )

        ),
      )
   
    );

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            child: Column(
              children: [
                 Text(prefs.idUser.toString(),
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )
                ),
                Text(prefs.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )
                ),
              ],
            )
        ),
      
      ],
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: Row(
        children: <Widget>[
          foto, 
          info
        ]
      ),
    );

  }


}