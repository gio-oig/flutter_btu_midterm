import 'package:flutter/material.dart';
import 'package:flutter_btu_midterm/data/models/clothes_model.dart';
import 'package:flutter_btu_midterm/data/repository/clothes_helper.dart';
import 'package:flutter_btu_midterm/widgets/custom_button.dart';
import 'package:flutter_btu_midterm/widgets/custom_input.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  static const routeName = '/add';

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idInputController = TextEditingController();
  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController imageInputController = TextEditingController();
  final TextEditingController sizeInputController = TextEditingController();
  final TextEditingController priceInputController = TextEditingController();
  final TextEditingController descriptionInputController =
      TextEditingController();
  // double _id = 0;

  @override
  Widget build(BuildContext context) {
    // final Map props = ModalRoute.of(context)!.settings.arguments as Map;

    // int count = props['count'];
    // inputController = TextEditingController(text: count.toString());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add',
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
                hint: 'Please enter ID',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: nameInputController,
                inputType: TextInputType.text,
                hint: 'Please enter name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: imageInputController,
                inputType: TextInputType.text,
                hint: 'Please enter image url',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: sizeInputController,
                inputType: TextInputType.text,
                hint: 'Please enter size',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: priceInputController,
                inputType: TextInputType.number,
                hint: 'Please enter price',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                controller: descriptionInputController,
                inputType: TextInputType.text,
                hint: 'Please enter description',
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                      text: 'Back',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  CustomButton(
                    text: 'Add',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Clothes newClothe = Clothes(
                            id: int.parse(idInputController.text),
                            name: nameInputController.text,
                            imageUrl: imageInputController.text,
                            size: sizeInputController.text,
                            price: double.parse(priceInputController.text),
                            description: descriptionInputController.text);

                        ClothesRepository().addClothe(newClothe);
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
