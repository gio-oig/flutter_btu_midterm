import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.size,
      required this.price,
      required this.description})
      : super(key: key);

  final String name;
  final String imageUrl;
  final String size;
  final double price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: FadeInImage(
                width: 150,
                height: 150,
                placeholder:
                    const AssetImage("assets\\images\\clothes_placeholder.png"),
                image: NetworkImage(imageUrl)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "\$ $price",
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
