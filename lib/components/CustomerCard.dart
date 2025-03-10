import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String svgPath; // Corrected type from Image to String
  final VoidCallback? onTap;

  const CustomCard({
    Key? key,
    required this.text,
    required this.svgPath, // SVG file path as String
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(40),
        margin: const EdgeInsets.symmetric(horizontal: 20), // Added margin
        decoration: BoxDecoration(
          color: Colors.grey[300], // Grey background
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              svgPath, // Use the correct path as a String
              width: 50,
              height: 50,

            ),
            const SizedBox(width: 25),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
