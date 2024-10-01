import 'package:chat_app/Pages/Cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/Pages/Cubits/regester_cubit/regester_cubit.dart';
import 'package:chat_app/Pages/chat_page.dart';
import 'package:chat_app/Pages/register_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/Login_page.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegesterCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
          LoginPage.id: (context) => LoginPage(),
        },
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
