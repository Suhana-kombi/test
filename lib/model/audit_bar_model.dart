class AuditData {
  String item;
  int count;
  String colour;

  AuditData({
    required this.item,
    required this.count,
    required this.colour,
  });

  factory AuditData.fromJson(Map<String, dynamic> json) => AuditData(
        item: json['Item'],
        count: json['Count'],
        colour: json['Colour'],
      );
}
