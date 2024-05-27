import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String comment;
  final Function onLike;

  const Comment({
    Key? key,
    required this.comment,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 46, 53),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                comment,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up, color: Colors.white),
              onPressed: () {
                onLike();
              },
            ),
          ],
        ),
      ),
    );
  }
}
