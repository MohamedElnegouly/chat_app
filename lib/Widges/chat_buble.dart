import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CustomChatBuble extends StatelessWidget {
  const CustomChatBuble({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //padding around countainer
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //padding around the text
        padding:
            const EdgeInsets.only(left: 16, top: 32, right: 32, bottom: 32),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomChatBubleTwo extends StatelessWidget {
  const CustomChatBubleTwo({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        //padding around countainer
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //padding around the text
        padding:
            const EdgeInsets.only(left: 16, top: 32, right: 32, bottom: 32),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
