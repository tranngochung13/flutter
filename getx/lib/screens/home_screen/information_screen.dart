import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/information.dart';
import 'package:getx/resources/strings.dart';
import 'package:getx/resources/widgets/common_widgets.dart';

class InformationScreen extends StatelessWidget {
  final InformationController controllerInfo = Get.put(InformationController());
  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as InformationScreen;

    // nameController.text = Get.arguments[0];
    // zaloController.text = Get.arguments[1];
    // websiteController.text = Get.arguments[2];
    // descriptionController.text = Get.arguments[3];
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

    getParam(item) {
      return Get.parameters[item];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION_INPUT),
        centerTitle: true,
      ),
      body: GetBuilder<InformationController>(
        init: InformationController(),
        builder: (information) {
          refreshField() {
            information.nameController.text = '';
            information.websiteController.text = '';
            information.zaloController.text = '';
            information.descriptionController.text = '';
          }

          information.nameController.text = getParam('name')!;
          information.websiteController.text = getParam('website')!;
          information.zaloController.text = getParam('zalo')!;
          information.descriptionController.text = getParam('description')!;

          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  inputWidget(
                    label: NAME,
                    hintText: NAME_INPUT,
                    controller: information.nameController,
                  ),
                  inputWidget(
                    label: ZALO,
                    hintText: ZALO_INPUT,
                    controller: information.zaloController,
                  ),
                  inputWidget(
                    label: WEBSITE,
                    hintText: WEBSITE_INPUT,
                    controller: information.websiteController,
                  ),
                  inputWidget(
                    label: DESCRIPTION,
                    hintText: DESCRIPTION_INPUT,
                    controller: information.descriptionController,
                  ),
                  buttonWidget(
                    lable: CONFIRM,
                    colorButton: Colors.blue,
                    colorText: Colors.white,
                    onPress: () {
                      controllerInfo.updateInformation(
                        name: information.nameController.text,
                        zalo: information.zaloController.text,
                        website: information.websiteController.text,
                        description: information.descriptionController.text,
                      );

                      // Get.put(Information()).updateInformation(
                      //   name: information.nameController.text,
                      //   zalo: information.zaloController.text,
                      //   website: information.websiteController.text,
                      //   description: information.descriptionController.text,
                      // );

                      Get.back();
                      refreshField();
                      showSnack();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
