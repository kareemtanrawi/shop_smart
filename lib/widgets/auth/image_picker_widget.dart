import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, this.pickImage, required this.function});

  final XFile? pickImage;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: pickImage == null
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  )
                : Image.file(
                    File(pickImage!.path),
              fit: BoxFit.fill,
                  ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Material(
            borderRadius: BorderRadius.circular(12),
            color: Colors.lightBlue,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                function();
              },
              splashColor: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.add_shopping_cart,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
