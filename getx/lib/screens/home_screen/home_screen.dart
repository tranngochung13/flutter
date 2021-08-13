import 'package:flutter/material.dart';
import 'package:getx/controllers/controller.dart';
import 'package:getx/controllers/information.dart';
import 'package:getx/resources/strings.dart';
import 'package:getx/resources/widgets/common_widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  void showBottomSheet(context) {
    Get.bottomSheet(Container(
      height: 320,
      color: Colors.lightBlue,
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.light_mode,
              color: Colors.white,
            ),
            title: Text(
              'Light theme',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {
              Get.changeTheme(ThemeData.light()),
              Navigator.pop(context),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
            title: Text(
              'Dark theme',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {
              Get.changeTheme(ThemeData.dark()),
              Navigator.pop(context),
            },
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
      body: GetBuilder<InformationController>(
        init: InformationController(),
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
                    final name = information.name;
                    final zalo = information.zalo;
                    final website = information.website;
                    final description = information.description;

                    final params =
                        "id=123&name=$name&zalo=$zalo&website=$website&description=$description";

                    Navigator.of(context).pushNamed('/info?$params');

                    // Navigator.of(context).pushNamed('/info', arguments: [
                    //   '${information.name}',
                    //   '${information.zalo}',
                    //   '${information.website}',
                    //   '${information.description}',
                    // ]);

                    // Navigator.of(context).pushNamed('/info', arguments: {
                    //   'name': '${information.name}',
                    //   'zalo': '${information.zalo}'
                    // });
                  },
                ),
                buttonWidget(
                  lable: 'Bottom Sheet',
                  colorButton: Colors.blue,
                  colorText: Colors.white,
                  onPress: () {
                    showBottomSheet(context);
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
