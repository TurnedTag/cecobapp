import 'package:flutter/material.dart';
import '../components/recommendation_item.dart';

class TopActivities extends StatelessWidget {
  final List<dynamic> topActivities;

  const TopActivities({
    Key? key,
    required this.topActivities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Top Atividades",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: topActivities.length,
                itemBuilder: (context, index) {
                  final activity = topActivities[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: RecommendationItem(
                      text:
                          "${activity['title']}, endereço: ${activity['address']['street']}, ${activity['address']['district']}.",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
