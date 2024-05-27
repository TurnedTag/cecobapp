import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentList extends StatelessWidget {
  final List<Map<String, dynamic>> comments;

  const CommentList({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: comments.reversed.map((comment) {
          DateTime dateTime = DateTime.parse(comment['createdAt']).toLocal();
          String formattedDate =
              DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
          String timezoneOffset = dateTime.timeZoneOffset.isNegative
              ? '-${dateTime.timeZoneOffset.abs().inHours.toString().padLeft(2, '0')}:${(dateTime.timeZoneOffset.abs().inMinutes % 60).toString().padLeft(2, '0')}'
              : '+${dateTime.timeZoneOffset.inHours.toString().padLeft(2, '0')}:${(dateTime.timeZoneOffset.inMinutes % 60).toString().padLeft(2, '0')}';

          if (timezoneOffset == '+00:00') {
            timezoneOffset = '-03:00';
          }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment['content'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        comment['author']['username'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '$formattedDate UTC$timezoneOffset',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
