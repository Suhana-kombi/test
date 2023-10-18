import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (homeController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            ));
          } else {
            if (homeController.homeModel == null) {
              return const Center(child: Text('No data available.'));
            } else {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 16, right: 16, bottom: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 100 / 60,
                                  crossAxisCount: 2),
                          itemCount:
                              homeController.homeModel!.dtAbstract?.length,
                          itemBuilder: (context, index) {
                            final abstractItem =
                                homeController.homeModel!.dtAbstract![index];
                            Color baseColor = Color(int.parse(
                                abstractItem.colour.replaceAll('#', '0xFF')));
                            Color opaqueColor = baseColor.withOpacity(0.3);
                            return Container(
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: opaqueColor),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, top: 22),
                                child: Text(
                                  '${abstractItem.count.toString()}\n\n${abstractItem.item}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              homeController.homeModel!.dtPerformance?.length,
                          itemBuilder: (context, index) {
                            final performance =
                                homeController.homeModel!.dtPerformance![index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color.fromARGB(
                                        255, 238, 214, 142)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(performance.itemDescription),
                                      Text(performance.statisticValue)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
