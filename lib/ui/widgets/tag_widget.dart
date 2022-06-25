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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(),
      ),
      height: 20.0,
      child: Center(
        child: Text(
          tag,
          style: const TextStyle(
            fontFamily: "SF Pro",
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
