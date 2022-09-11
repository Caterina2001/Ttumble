import 'package:flutter/material.dart';
import 'package:ttumble/views/utils/AppColor.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            100,
            52,
          ),
          primary: AppColor.primary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.calendar_month,
              size: 38,
            ),
            const SizedBox(width: 0),
            Text(
              ' Show Picker',
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 30, fontFamily: 'Ang'),
            ),
          ],
        ),
        onPressed: onClicked,
      );
}
