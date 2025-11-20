import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/data/firebase/firebase_database_user.dart';
import 'package:todo_app/auth/data/moodle/user_moodle.dart';
import 'package:todo_app/auth/widgets/navigator_tayp_auth_widget.dart';
import 'package:todo_app/auth/widgets/text_form_field_widget.dart';
import 'package:todo_app/core/network/res_firebase.dart';
import 'package:todo_app/core/utils/app_dialog.dart';
import 'package:todo_app/core/utils/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routesName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var fullName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formkey,
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
                validator: Validator.validateName,
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
                controller: email,
                validator: Validator.validateEmail,
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
                validator: Validator.validatePassword,
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
                validator: (text) {
                  return Validator.validateConfirmPassword(text, password.text);
                },
                isPassword: true,
                obscureText: true,
              ),
              SizedBox(height: 70),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    await register();
                  }
                },
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

  Future<void> register() async {
    AppDialog.showLoding(context);
    final rse = await FBSAUser.registerUser(
      UserMoodle(
        email: email.text,
        password: password.text,
        name: fullName.text,
      ),
    );
    switch (rse) {
      case SuccessFB<UserMoodle>():
        Navigator.of(context).pop();
        fullName.clear();
        email.clear();
        password.clear();
        confirmPassword.clear();
        Navigator.of(context).pop();

      case ErrorFB<UserMoodle>():
        Navigator.of(context).pop();
        AppDialog.showError(context, error: rse.messageEroor);
    }
  }
}
