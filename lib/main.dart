import 'package:flutter/material.dart';
import 'package:todo_app/auth/view/login_screen.dart';
import 'package:todo_app/auth/view/register_screen.dart';

void main(){
  runApp(ToDoApp());
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    initialRoute:LoginScreen.routesName,
    routes: {
      LoginScreen.routesName:(context)=> LoginScreen(),
      RegisterScreen.routesName:(context)=> RegisterScreen(),
    },
    );
  }
}
