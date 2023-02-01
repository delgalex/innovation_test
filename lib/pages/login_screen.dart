import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';
import '../providers/login_service.dart';
import '../ui/input_decorations.dart';
import '../widgets/auth_background.dart';
import '../widgets/card_login_container.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground( 
        child: SingleChildScrollView( 
          child: Column(
            children: [
             
            const SizedBox(height: 250),
             
             CardLoginContainer(
               child: Column(
                 children: [
                   const SizedBox( height: 10 ),
                   Text('Enter your user ID', style: Theme.of(context).textTheme.headline5 ), 
                   const SizedBox( height: 30),                   
                   ChangeNotifierProvider(
                    create: ( _ ) => LoginFormProvider(),
                    child: _LoginForm()
                  )                
                 ],
               )
             ),          
            ],
          ),
        )
      ),
    );
  }

}

class _LoginForm extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
  
      child: Form(     
        key: loginForm.formKey,
        autovalidateMode :  AutovalidateMode.onUserInteraction,   
        child: Column(
          children: [

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'User ID',
                pefixIcon: Icons.person
              ),
              onChanged: (value) => loginForm.email= value,
               validator: ( value ) {                
                return ( value != null)
                  ? null
                  : 'Error';
              }
            ),

            const SizedBox(height: 30),

           MaterialButton(
              shape: RoundedRectangleBorder( borderRadius:  BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.blue[900],
              onPressed: loginForm.isLoanding ? null : () async{
                FocusScope.of(context).unfocus(); // quita el teclado
                final loginService = Provider.of<LoginService>(context, listen: false); // listen false por estar dentro de un mètodo
            
                if( !loginForm.isValidForm()) return;
                  loginForm.isLoanding = true;
                  final String? errorMensaje = await loginService.login(loginForm.email);

                if( errorMensaje == null  ){
                  Navigator.pushReplacementNamed(context, 'employeeList');//
                }else{                
                  loginForm.isLoanding = false;
                  final snackBar = SnackBar( content: Text('User incorrect'));
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);                 
                }
                
              },
              child: Container(
                padding:  const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoanding
                  ? 'Wait...'
                  : 'Login',
                  style: const TextStyle( color: Colors.white),
                )  
              ),
            ),

            const SizedBox(height: 30),
            
          ],
        ),
      ),     
    );
  }
}