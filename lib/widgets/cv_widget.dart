import 'package:flutter/material.dart';

class CvWidget extends StatelessWidget {
  final String text;

  const CvWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      width: 200,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 161, 200).withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Color.fromARGB(255, 229, 143, 232), blurRadius: 10)
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.star,
              color: Color.fromARGB(255, 251, 233, 74),
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            )
          ],
        ),
      ),
    );
  }
}
