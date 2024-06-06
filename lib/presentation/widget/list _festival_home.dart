import 'package:flutter/material.dart';

class ListFestivalHome extends StatelessWidget {
  final String? image;
  final String? title;
  final Function? onTap;
  ListFestivalHome(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        width: 289,
        height: 221,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2))
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 142,
              width: 267,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(
                        image!,
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                title!,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
