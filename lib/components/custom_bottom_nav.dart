import 'package:flutter/material.dart';

class CustomBottomNavItem {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  CustomBottomNavItem({
    required this.icon,
    required this.text,
    required this.onPressed,
  });
}

class CustomBottomNav extends StatelessWidget {
  final List<CustomBottomNavItem> items;

  const CustomBottomNav({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          return Expanded(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: item.onPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(item.icon, size: 24, color: Colors.black),
                    const SizedBox(height: 2),
                    Flexible(
                      child: Text(
                        item.text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
