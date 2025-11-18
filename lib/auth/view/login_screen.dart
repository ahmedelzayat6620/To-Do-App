import 'package:flutter/material.dart';
import 'package:todo_app/auth/view/register_screen.dart';
import 'package:todo_app/auth/widgets/navigator_tayp_auth_widget.dart';
import 'package:todo_app/auth/widgets/text_form_field_widget.dart';
import 'package:todo_app/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routesName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emil = TextEditingController();
  var password = TextEditingController();
  var fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: fromkey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: 122),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                 color: Color(0xff24252C), 
                ),
              ),
              SizedBox(height: 53),
              Text(
                "Emil",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff24252C),
                ),
              ),
              SizedBox(height: 5),
              TextFormFieldWidget(
                hintText: "Enter your Email",
                controller: emil,
                 validator:Validator.validateEmail,),
              SizedBox(height: 26),
              Text(
                "password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff24252C),
                ),
              ),
              SizedBox(height: 5),
              TextFormFieldWidget(
                hintText: "Enter your password",
                controller: password, 
                validator:Validator.validatePassword
              ,isPassword: true,obscureText: true,),
              SizedBox(height: 70),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed:(){
                  if(fromkey.currentState!.validate()){}
                },
                color: Color(0xff5F33E1),
                minWidth: double.infinity,
                height: 48,
                child: Text("Login",style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   color: Color(0xffffffff),
                ),),
                ),
            ],      
          ),
        ),
      ),
                  //Don’t have an account? Register
         bottomNavigationBar:  NavigatorTaypAuth(
        title: "Don’t have an account?",
        subTitle: "Register",
        onTap: () {
          Navigator.of(context).pushNamed(RegisterScreen.routesName);
        },
      )

    );
  }
}
