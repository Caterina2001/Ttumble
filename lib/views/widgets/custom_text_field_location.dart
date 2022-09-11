import 'package:flutter/material.dart';
import 'package:ttumble/views/utils/AppColor.dart';

class CustomTextFieldLocation extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final bool obsecureText;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  CustomTextFieldLocation({
    required this.title,
    required this.hint,
    required this.controller,
    this.obsecureText = false,
    required this.padding,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              '$title',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.primaryExtraSoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(fontSize: 14),
              cursorColor: AppColor.primary,
              obscureText: obsecureText,
              decoration: InputDecoration(
                hintText: '$hint',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                contentPadding: EdgeInsets.only(left: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
