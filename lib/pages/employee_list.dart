import 'package:flutter/material.dart';
import 'package:innovation_test_application/widgets/menu_widget.dart';


class EmployeeList extends StatelessWidget {
  
  const EmployeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Employee List"),
      ),
      drawer: MenuWidget(),
      body: const Center(
        child: Text('Employee List'),
     ),
   );
  }
}