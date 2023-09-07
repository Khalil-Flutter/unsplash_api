import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash_api/controller/simple_ui_&_api_controller.dart';

// ignore: must_be_immutable
class TabbBar extends StatelessWidget {
  TabbBar({super.key});

  SimpleUIController homeController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: homeController.orders.length,
      itemBuilder: (context, index) {
        return Obx(
          () {
            return GestureDetector(
              onTap: () {
                homeController.selectedIndex.value = index;
                homeController.ordersFunc(
                  homeController.orders[index],
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.fromLTRB(index == 0 ? 15 : 5, 0, 5, 0),
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      index == homeController.selectedIndex.value ? 18 : 15,
                    ),
                  ),
                  color: index == homeController.selectedIndex.value
                      ? Colors.grey.shade700
                      : Colors.grey.shade200,
                ),
                child: Center(
                  child: Text(
                    homeController.orders[index],
                    style: TextStyle(
                      color: index == homeController.selectedIndex.value
                          ? Colors.white
                          : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
