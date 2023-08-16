// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/id_card_controller.dart';
import 'id_card_text_widget.dart';

class IdCard extends StatelessWidget {
  IdCard({super.key, this.profileImage});
  File? profileImage;
  final IdCardController idCardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IdCardController>(
      builder: (_) => Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Color(0xffE9E6E2), Colors.white]),
            border: Border.all(width: .5, color: Colors.grey.shade900)),
        child: Row(
          children: [
            GestureDetector(
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6)),
                    image: profileImage != null
                        ? DecorationImage(
                            image: FileImage(
                                File(idCardController.imagePath.value)),
                            fit: BoxFit.cover)
                        : null),
                child: profileImage == null
                    ? Center(
                        child: Text(
                          'Tap \nhere To add Photo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : null,
              ),
              onTap: () {
                getImage();
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        idCardController.name.value,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2F435A)),
                      ),
                      const SizedBox(height: 10),
                      IdCardSubtitle(
                        title: 'Age',
                        subtitle: idCardController.age.value,
                      ),
                      const SizedBox(height: 10),
                      IdCardSubtitle(
                        title: 'Batch',
                        subtitle: idCardController.batch.value,
                      ),
                      const SizedBox(height: 10),
                      IdCardSubtitle(
                        title: 'Register Number',
                        subtitle: idCardController.regNum.value,
                      ),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Oxford University',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff041F60)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = File(image.path);
      idCardController.addImage(profileImage!.path);
    }
  }
}
