import 'package:flutter/material.dart';
import 'package:simalungun_tourism/common/helper.dart';

class ListBeritahome extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  final String? date;
  final Function? onTap;

  ListBeritahome(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.date,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap as void Function()?,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10),
          height: 123,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3))
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Container(
                height: 98,
                width: 131,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(
                        image!,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      title!,
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        description!,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Text(
                      Helper.dateText(date!),
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
