import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  // final IconData icon;
  final String text;
  final VoidCallback onClicked;
  // final int height;
  const ButtonWidget({Key? key, required this.text, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          maximumSize: const Size.fromHeight(50),
        ),
        child: buildContent(),
        onPressed: onClicked);
  }

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(icon,size: 28),
          // SizedBox(width: 10,),
          Text(
            text,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          )
        ],
      );
}
