import 'package:chat_app/Pages/Cubits/regester_cubit/regester_cubit.dart';
import 'package:chat_app/Pages/Login_page.dart';
import 'package:chat_app/Pages/chat_page.dart';
import 'package:chat_app/Widges/custom_button.dart';
import 'package:chat_app/Widges/custom_text_field.dart';
import 'package:chat_app/helper/showSnakBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';

class RegisterPage extends StatelessWidget {
  static String id = 'RegisterPageId';
  String? email;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoding = false;

  // static to use id as in class not take an object from the page
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegesterCubit, RegesterState>(
      listener: (context, state) {
        if (state is RegesterLoading) {
          isLoding = true;
        } else if (state is RegesterSuccess) {
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoding = false;
        } else if (state is RegesterFaliure) {
          showSnacBar(context, state.errMessage);
          isLoding = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoding,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkey,
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    klogo,
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    obsecureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<RegesterCubit>(context)
                            .regesterUser(email: email!, password: password!);
                      } else {}
                    },
                    text: 'REGISTER',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        child: const Text(
                          '  Login',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
