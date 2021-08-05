import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Information extends GetxController {
  late String name = '';
  late String zalo = '';
  late String website = '';
  late String description = '';

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
