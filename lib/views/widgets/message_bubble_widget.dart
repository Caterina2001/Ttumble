import 'package:flutter/material.dart';

import '../../models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMe = message.isSentByMe;
    final backgroundColor =
        isMe ? Theme.of(context).colorScheme.primary : Colors.white;
    final color = isMe ? Colors.white : Theme.of(context).colorScheme.primary;

    return Container(
      margin: const EdgeInsets.all(10),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(50).copyWith(
            topLeft: !isMe ? const Radius.circular(0) : null,
            topRight: isMe ? const Radius.circular(0) : null,
          ),
          color: backgroundColor,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              message.text,
              style: TextStyle(color: color, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
