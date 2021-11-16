import 'package:flutter/material.dart';
import 'package:flutter_btu_midterm/data/models/clothes_model.dart';
import 'package:flutter_btu_midterm/data/repository/clothes_helper.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final Map props = ModalRoute.of(context)!.settings.arguments as Map;

    Clothes clothe = props['clothe'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text("Do you what do delete this item?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('no'),
                          ),
                          TextButton(
                            onPressed: () {
                              ClothesRepository().removeClothe(clothe.id);
                              Navigator.pop(context);
                              Navigator.pop(context, 'yes');
                            },
                            child: const Text('yes'),
                          ),
                        ],
                      )),
              icon: const Icon(Icons.delete))
        ],
        //  ClothesRepository().removeClothe(clothe.id);
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 40, left: 40),
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    image: DecorationImage(
                        // fit: BoxFit.fill,
                        image: NetworkImage(clothe.imageUrl))),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Name:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    clothe.name,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'price:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "${clothe.price}",
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Size:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    clothe.size,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                clothe.description,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
