import 'package:flutter/material.dart';
import 'package:todo_app/auth/view/login_screen.dart';
import 'package:todo_app/auth/view/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
