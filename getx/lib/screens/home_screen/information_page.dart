import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/models/information.dart';
import 'package:getx/resources/strings.dart';
import 'package:getx/resources/widgets/button_widgets.dart';
import 'package:getx/resources/widgets/input_widget.dart';

class InformationPage extends StatefulWidget {
  final String nameController,
      websiteController,
      zaloController,
      descriptionController;

  InformationPage(
    this.nameController,
    this.websiteController,
    this.zaloController,
    this.descriptionController,
  );
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late TextEditingController nameController,
      websiteController,
      zaloController,
      descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.nameController);
    websiteController = TextEditingController(text: widget.websiteController);
    zaloController = TextEditingController(text: widget.zaloController);
    descriptionController =
        TextEditingController(text: widget.descriptionController);
  }

  void showSnackBar(text) {
    final snackBar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSnack() {
    Get.snackbar(
      "Infomation", // title
      "Updated success!", // message
      icon: Icon(Icons.update),
      shouldIconPulse: true,
      // onTap: () {},
      isDismissible: true,
      backgroundColor: Colors.amber,
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION_INPUT),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              inputWidget(
                label: NAME,
                hintText: NAME_INPUT,
                controller: nameController,
              ),
              inputWidget(
                label: ZALO,
                hintText: ZALO_INPUT,
                controller: zaloController,
              ),
              inputWidget(
                label: WEBSITE,
                hintText: WEBSITE_INPUT,
                controller: websiteController,
              ),
              inputWidget(
                label: DESCRIPTION,
                hintText: DESCRIPTION_INPUT,
                controller: descriptionController,
              ),
              buttonWidget(
                lable: CONFIRM,
                colorButton: Colors.blue,
                colorText: Colors.white,
                onPress: () {
                  Get.put(Information()).updateInformation(
                    name: nameController.text,
                    zalo: zaloController.text,
                    website: websiteController.text,
                    description: descriptionController.text,
                  );

                  Get.back();
                  showSnack();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
