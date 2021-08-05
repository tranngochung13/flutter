import 'package:flutter/material.dart';
import 'package:getx/controllers/controller.dart';
import 'package:getx/models/information.dart';
import 'package:getx/resources/strings.dart';
import 'package:getx/resources/widgets/button_widgets.dart';
import 'package:get/get.dart';
import 'package:getx/resources/widgets/information_widget.dart';

import 'information_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController nameController,
      websiteController,
      zaloController,
      descriptionController;

  final Controller controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    websiteController = TextEditingController();
    zaloController = TextEditingController();
    descriptionController = TextEditingController();
  }

  void showBottomSheet() {
    Get.bottomSheet(Container(
      height: 320,
      color: Colors.lightBlue,
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.book,
              color: Colors.white,
            ),
            title: Text(
              'Book',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.pending,
              color: Colors.white,
            ),
            title: Text(
              'pending',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {},
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION),
        centerTitle: true,
      ),
      body: GetBuilder<Information>(
        init: Information(),
        builder: (information) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                informationWidget(
                    label: NAME,
                    content: information.name == ''
                        ? INFORMATION_NONE
                        : information.name),
                Divider(),
                informationWidget(
                    label: ZALO,
                    content: information.zalo == ''
                        ? INFORMATION_NONE
                        : information.zalo),
                Divider(),
                informationWidget(
                    label: WEBSITE,
                    content: information.website == ''
                        ? INFORMATION_NONE
                        : information.website),
                Divider(),
                informationWidget(
                    label: DESCRIPTION,
                    content: information.description == ''
                        ? INFORMATION_NONE
                        : information.description),
                Divider(),
                buttonWidget(
                  lable: UPDATE,
                  colorButton: Colors.blue,
                  colorText: Colors.white,
                  onPress: () {
                    Get.to(InformationScreen(
                      information.name,
                      information.website,
                      information.zalo,
                      information.description,
                    ));
                  },
                ),
                buttonWidget(
                  lable: 'Bottom Sheet',
                  colorButton: Colors.blue,
                  colorText: Colors.white,
                  onPress: () {
                    showBottomSheet();
                  },
                ),
                Divider(),
                Obx(
                  () => Text(
                    "${controller.count}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.increment,
      ),
    );
  }
}
