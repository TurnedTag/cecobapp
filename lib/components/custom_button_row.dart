import 'package:flutter/material.dart';

class CustomButtonRow extends StatelessWidget {
  final VoidCallback onDestaquesPressed;
  final VoidCallback onMelhoriasPressed;

  const CustomButtonRow({
    Key? key,
    required this.onDestaquesPressed,
    required this.onMelhoriasPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomStyledButton(
          onPressed: onDestaquesPressed,
          text: 'Destaques',
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shadowColor: Colors.blue.shade700.withOpacity(0.5),
        ),
        const SizedBox(width: 20),
        CustomStyledButton(
          onPressed: onMelhoriasPressed,
          text: 'Melhorias',
          gradient: LinearGradient(
            colors: [Colors.green.shade400, Colors.green.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shadowColor: Colors.green.shade700.withOpacity(0.5),
        ),
      ],
    );
  }
}

class CustomStyledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Gradient gradient;
  final Color shadowColor;

  const CustomStyledButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.gradient,
    required this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
