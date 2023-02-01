import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:innovation_test_application/widgets/card_employee.dart';
import 'package:innovation_test_application/providers/service_provider.dart';
import 'package:innovation_test_application/widgets/menu_widget.dart';

class EmployeeList extends StatelessWidget {
  
  const EmployeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    serviceProvider.getEmployees();

      return SafeArea(
          child: Scaffold(
        
          appBar:AppBar(
                  title: Text("Lista de Empleados")
                  ),
          drawer: MenuWidget(),
          body: Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: CardEmployee( employee: serviceProvider.showEmployee),
            ) 
      ),
    );
  }
}