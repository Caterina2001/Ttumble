import 'package:flutter/material.dart';
import 'package:ttumble/views/prueba.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class NewMessageWidget extends StatefulWidget {
  final ValueChanged<String> onSubmitted;

  const NewMessageWidget({
    key,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  State<NewMessageWidget> createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 10,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                elevation: 5,
                child: TextField(
                  controller: controller,
                  onSubmitted: widget.onSubmitted,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    hintText: 'Type your message here...',
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            MaterialButton(
              shape: const CircleBorder(),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                if (controller.text.trim().isEmpty) return;

                widget.onSubmitted(controller.text);

                controller.clear();
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.send, color: Colors.white),
              ),
            ),
            MaterialButton(
              shape: const CircleBorder(),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Prueba(),
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.camera_alt_sharp, color: Colors.white),
              ),
            ),
          ],
        ),
      );
}
