import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_shop/controllers/productc_controller.dart';
import 'package:online_shop/views/widgets/progres_indicatior.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  final productcController = ProductcController();

  final titleController = TextEditingController();

  final priceController = TextEditingController();

  final imageController = TextEditingController();

  File? imageFile;

  void uploadImage(ImageSource imageSource) async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: imageSource);

    if (pickedImage != null) {
      setState(
        () {
          imageFile = File(pickedImage.path);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 151, 215, 153),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add a new product'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                        ),
                      ),
                      TextField(
                        controller: priceController,
                        decoration: const InputDecoration(
                          hintText: 'Price',
                        ),
                      ),
                      const Gap(30),
                      const Text("Rasm tanlang"),
                      const Gap(10),
                      imageFile != null
                          ? SizedBox(
                              height: 280,
                              width: double.infinity,
                              child: Image.file(
                                imageFile!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Text("Please choose the photo"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              uploadImage(ImageSource.camera);
                            },
                            child: const Text("camera"),
                          ),
                          TextButton(
                            onPressed: () async {
                              uploadImage(ImageSource.gallery);
                            },
                            child: const Text("galary"),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("cansel"),
                          ),
                          FilledButton(
                            onPressed: () async {
                              ProgresIndicatior.showProgressDialog(context);
                              await productcController.addNewProduct(
                                double.parse(priceController.text),
                                titleController.text,
                                imageFile!,
                              );
                              // ignore: use_build_context_synchronously
                              if (context.mounted) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
