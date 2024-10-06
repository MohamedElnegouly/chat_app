import 'package:chat_app/Pages/Cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/Pages/Cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/Pages/chat_page.dart';
import 'package:chat_app/Pages/register_Screen.dart';
import 'package:chat_app/Widges/custom_button.dart';
import 'package:chat_app/Widges/custom_text_field.dart';
import 'package:chat_app/helper/showSnakBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';

class LoginPage extends StatelessWidget {
  static String id = 'loginPghrhrthage';

  String? username;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, ChatPage.id, arguments: username);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnacBar(context, state.errMessage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
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
                        'LOGIN',
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
                      username = data;
                    },
                    hintText: 'User name',
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
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).loginUser(
                            username: username!, password: password!);
                      } else {}
                    },
                    text: 'LOGIN',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'dont have an account ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: const Text(
                          '  Register',
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
