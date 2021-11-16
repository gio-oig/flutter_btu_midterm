import 'package:flutter/material.dart';
import 'package:flutter_btu_midterm/data/models/clothes_model.dart';
import 'package:flutter_btu_midterm/data/repository/clothes_helper.dart';
import 'package:flutter_btu_midterm/widgets/custom_button.dart';
import 'package:flutter_btu_midterm/widgets/custom_input.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);
  static const routeName = '/edit';

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController idInputController;
  late TextEditingController nameInputController;
  late TextEditingController imageInputController;
  late TextEditingController sizeInputController;
  late TextEditingController priceInputController;
  late TextEditingController descriptionInputController;

  @override
  Widget build(BuildContext context) {
    final Map props = ModalRoute.of(context)!.settings.arguments as Map;

    Clothes clothe = props['clothe'];
    int clotheIndex = props['index'];

    idInputController = TextEditingController(text: clothe.id.toString());
    nameInputController = TextEditingController(text: clothe.name);
    imageInputController = TextEditingController(text: clothe.imageUrl);
    sizeInputController = TextEditingController(text: clothe.size);
    priceInputController = TextEditingController(text: clothe.price.toString());
    descriptionInputController =
        TextEditingController(text: clothe.description);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Edit',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 50, bottom: 20, right: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInput(
                controller: idInputController,
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: nameInputController,
                inputType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: imageInputController,
                inputType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: sizeInputController,
                inputType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: priceInputController,
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: descriptionInputController,
                inputType: TextInputType.text,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    text: 'Back',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomButton(
                    text: 'Edit',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Clothes editedClothe = Clothes(
                            id: int.parse(idInputController.text),
                            name: nameInputController.text,
                            imageUrl: imageInputController.text,
                            size: sizeInputController.text,
                            price: double.parse(priceInputController.text),
                            description: descriptionInputController.text);

                        ClothesRepository()
                            .editClothe(clotheIndex, editedClothe);
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
