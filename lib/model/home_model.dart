import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

class HomeModel {
  List<DtAbstract>? dtAbstract;
  List<DtPerformance>? dtPerformance;

  HomeModel({
    this.dtAbstract,
    this.dtPerformance,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        dtAbstract: List<DtAbstract>.from(
            json["dtAbstract"].map((x) => DtAbstract.fromJson(x))),
        dtPerformance: List<DtPerformance>.from(
            json["dtPerformance"].map((x) => DtPerformance.fromJson(x))),
      );
}

class DtAbstract {
  String item;
  int count;
  String colour;
  String moduleLogo;

  DtAbstract({
    required this.item,
    required this.count,
    required this.colour,
    required this.moduleLogo,
  });

  factory DtAbstract.fromJson(Map<String, dynamic> json) => DtAbstract(
      item: json["Item"] ?? '',
      count: json["Count"] ?? 0,
      colour: json["Colour"],
      moduleLogo: json["ModuleLogo"] ?? '');
}

class DtPerformance {
  String itemDescription;
  String statisticValue;

  DtPerformance({
    required this.itemDescription,
    required this.statisticValue,
  });

  factory DtPerformance.fromJson(Map<String, dynamic> json) => DtPerformance(
        itemDescription: json["ItemDescription"] ?? '',
        statisticValue: json["StatisticValue"] ?? '',
      );
}
