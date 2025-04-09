import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  const Modal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black,
        //     blurRadius: 5,
        //     offset: Offset.zero,
        //   ),
        // ],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      width: 60,
      height: 60,
      child: TextButton(
        child: Text('teste'),
        onPressed: () => null,
      ),
    );
  }
}
