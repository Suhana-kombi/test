import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import '../controller/audit_controller.dart';

class AuditScreen extends StatelessWidget {
  final AuditController auditController = Get.put(AuditController());

  AuditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (auditController.auditBarData.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            ));
          } else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Text(
                        'AUDIT',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: BarChart(
                        BarChartData(
                          gridData: FlGridData(
                            checkToShowVerticalLine: (value) => false,
                          ),
                          backgroundColor: Colors.black12,
                          titlesData: const FlTitlesData(
                              bottomTitles: AxisTitles(
                                  drawBelowEverything: false,
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                  ))),
                          borderData: FlBorderData(show: false),
                          barTouchData: BarTouchData(),
                          barGroups: auditController.auditBarData.map((data) {
                            return BarChartGroupData(
                              x: auditController.auditBarData.indexOf(data),
                              barRods: [
                                BarChartRodData(
                                  toY: data.count.toDouble(),
                                  color: Color(int.parse(
                                      data.colour.replaceAll('#', '0xFF'))),
                                  width: 16,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ],
                              showingTooltipIndicators: [0],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: auditController.auditListData.length,
                      itemBuilder: (context, index) {
                        final auditDataList =
                            auditController.auditListData[index];
                        return ListTile(
                          title: Text(auditDataList.auditDesc),
                          isThreeLine: true,
                          subtitle: Text(
                              '${auditDataList.auditNo}\n${auditDataList.auditLocation}'),
                        );
                      },
                    ))
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
