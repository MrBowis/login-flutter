import 'package:flutter/material.dart';
import 'package:login/views/home_view.dart';
import 'package:login/themes/app_themes.dart';
import 'package:login/views/login_view.dart';
import 'package:login/views/signup_view.dart';

void main(){
  runApp(MaterialApp(
    title: 'Log In',
    theme: AppThemes().darkTheme,
    initialRoute: '/',
    routes: {
      '/':(context)=> const HomeView(),
      '/login': (context)=> const LoginView(),
      '/signup': (context)=> const SignUpView(),
    },

    debugShowCheckedModeBanner: false,
  ));
}