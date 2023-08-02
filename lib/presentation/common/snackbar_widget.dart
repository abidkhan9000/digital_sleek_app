

import 'package:flutter/material.dart';

class SnackBarWidget {
  static buildSnackBar(
      BuildContext context,
      String message,
      Color color,
      IconData icon,
      bool isFloating,
      ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Wrap(
        direction: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10,),
          Text(
            message,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 15,
            )
          ),
        ],
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
      behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    ));
  }
}