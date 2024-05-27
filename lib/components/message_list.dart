import 'package:flutter/material.dart';
import 'message.dart';

class MessageList extends StatelessWidget {
  final List<String> messages;
  final Function(int) onLike;

  const MessageList({
    Key? key,
    required this.messages,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: messages.asMap().entries.map((entry) {
          int idx = entry.key;
          String message = entry.value;
          return Message(
            message: message,
            onLike: () => onLike(idx),
          );
        }).toList(),
      ),
    );
  }
}
