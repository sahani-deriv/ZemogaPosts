import 'package:flutter/material.dart';

///{@template custom_snack_bar}
/// A customized snack bar for this app.
/// {@endtemplate}
class CustomSnackBar extends StatelessWidget {
  ///{@macro custom_snack_bar}
  const CustomSnackBar({super.key, required this.message});

  /// Message to be displayed in the snack bar.
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.info_outline,
          color: Colors.blueAccent,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
