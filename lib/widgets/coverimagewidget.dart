import 'package:flutter/material.dart';


class BookCoverimageWidget extends StatelessWidget {
  const BookCoverimageWidget({
    super.key,
    required this.bookcoverimage,
    required this.bookcovername,
  });

  final String bookcoverimage;
  final String bookcovername;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              bookcoverimage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 70.0,
            left: 75.0,
            child: Text(
              bookcovername,
              style: const TextStyle(
                  fontFamily: "Lexend",
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
