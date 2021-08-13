import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationController extends GetxController {
  late String name = '';
  late String zalo = '';
  late String website = '';
  late String description = '';

  late TextEditingController nameController = TextEditingController();
  late TextEditingController websiteController = TextEditingController();
  late TextEditingController zaloController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();

  updateInformation({
    @required name,
    @required zalo,
    @required website,
    @required description,
  }) {
    this.name = name;
    this.zalo = zalo;
    this.website = website;
    this.description = description;
    update();
  }
}
