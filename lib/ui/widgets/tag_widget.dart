import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({Key? key, required this.tag}) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 20.0,
      child: Center(
        child: Text(
          tag,
          style: const TextStyle(
            fontFamily: "SF Pro",
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
