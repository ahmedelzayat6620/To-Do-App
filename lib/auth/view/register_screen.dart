import 'package:flutter/material.dart';
import 'package:todo_app/auth/widgets/navigator_tayp_auth_widget.dart';
import 'package:todo_app/auth/widgets/text_form_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routesName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();


}

class _RegisterScreenState extends State<RegisterScreen> {
    var fullName = TextEditingController();
    var emil = TextEditingController();
    var password = TextEditingController();
    var confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            Text(
              "Register",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xff24252C),
              ),
            ),
            SizedBox(height: 23),
            Text(
              "Full Name",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff24252C),
              ),
            ),
            SizedBox(height: 5),
            TextFormFieldWidget(
              hintText: "Enter your Full Name",
              controller: fullName,
              validator: (text) {},
            ),
            SizedBox(height: 26),
            Text(
              "Email",
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
              validator: (text) {},
            ),
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
              hintText: "password...",
              controller: password,
              validator: (text) {},
              isPassword: true,
              obscureText: true,
            ),
            SizedBox(height: 23),
            Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff24252C),
              ),
            ),
            SizedBox(height: 5),
            TextFormFieldWidget(
              hintText: "password...",
              controller: password,
              validator: (text) {},
              isPassword: true,
              obscureText: true,
            ),
            SizedBox(height: 70),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {},
              color: Color(0xff5F33E1),
              minWidth: double.infinity,
              height: 48,
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ],
        ),
      ),
      //Already have an account? Login
      bottomNavigationBar: NavigatorTaypAuth(
        title: "Already have an account?",
        subTitle: "Login",
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
  bool isValid(String input){
    // Source - https://stackoverflow.com/a
// Posted by Suragch, modified by community. See post 'Timeline' for change history
// Retrieved 2025-11-17, License - CC BY-SA 4.0

// final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
// alphanumeric.hasMatch('abc123');  // true
// alphanumeric.hasMatch('abc123%'); // false
    RegExp reg = RegExp(r'^[a-zA-Z0-9]+$');
    return reg.hasMatch(input);
  }
}