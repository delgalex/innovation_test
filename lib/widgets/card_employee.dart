import 'package:flutter/material.dart';
import 'package:innovation_test_application/models/employee.dart';

class CardEmployee extends StatelessWidget {

  final List<Employee> employee;

  CardEmployee({
    required this.employee
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: employee.length,
            itemBuilder: (context, index){
              return _buildCard(index, context, employee[index]);
            }
    );
  }
  
  Widget _buildCard(int index, BuildContext context, Employee employee) {

    return GestureDetector(
            
            onTap: ()=> Navigator.pushNamed(context, 'employeeDetails', arguments: employee),
            child: Card(
            //elevation: 10.0,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _circulo(), 
                    Expanded(             
                    child:_descripcion(index)
                    )
                  ],
                )
              ],
            ),
          ),
      );   

  }

  Widget _circulo(){
    return Container(
        margin: EdgeInsets.all(10.0),
        width: 50,
        height: 50,
        decoration: const BoxDecoration(         
          shape:BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/circulo.jpg')
          )
        )
    );
  }

  Widget _descripcion (int index){
  return  Row(
           // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,                
                  children: [
                    Container(
                      width: 200.0,  
                      child: Text(
                        employee[index].employeeName,
                        overflow: TextOverflow.ellipsis,
                            
                      ),
                    ),
                    Text(
                      employee[index].employeeSalary.toString(),                             
                    ),
                  ],
                ),
            //  SizedBox(width: 20.0),
              
               Expanded(
                 child: Container(
                   padding: EdgeInsets.all(10.0),
                   child: Column(               
                     crossAxisAlignment: CrossAxisAlignment.end, 
                     children: <Widget>[  
                       Text(
                          employee[index].employeeAge.toString(),                     
                        ),
                     ]
                    ),
                 ),
               )                              

            ],
          );
  }

}
