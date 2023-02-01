import 'package:flutter/material.dart';
import 'package:innovation_test_application/models/employee.dart';


class EmployeeDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Employee employee = ModalRoute.of(context)!.settings.arguments as Employee;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(employee),
          SliverList(
            delegate: SliverChildListDelegate(
              [
              const SizedBox( height: 10.0 ),
               _descripcion(employee)
              ]
            ),
          )
        ],
      ),  
    );
  }

  Widget _crearAppBar( Employee employee) {
    return SliverAppBar(
      elevation: 2.0,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: Text(
            employee.employeeName,
            style: const TextStyle(color: Colors.white, fontFamily: 'Lato',fontSize: 17.0, fontWeight: FontWeight.bold),
          ),  
          background: const Image(image: AssetImage( 'assets/images/circulo.jpg' ), fit:BoxFit.cover),
        ),
    );
  }

  Widget _descripcion( Employee employee ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text('ID: ${employee.id}'),
                      Text('Nombre: ${employee.employeeName}'),
                      Text('Salario: ${employee.employeeSalary}', style: TextStyle(color: employee.employeeSalary > 1000? Colors.green: Colors.red)),
                      Text('Edad: ${employee.employeeAge}', style: TextStyle(color: employee.employeeAge > 25 && employee.employeeAge >35 ? Colors.green: Colors.red)),                      
                  ],
              ),        
    );

  }
}