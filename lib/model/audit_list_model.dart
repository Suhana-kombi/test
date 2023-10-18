import 'dart:convert';

List<AuditList> auditListFromJson(String str) =>
    List<AuditList>.from(json.decode(str).map((x) => AuditList.fromJson(x)));

class AuditList {
  int auditId;
  String auditNo;
  String auditType;
  String auditDesc;
  String auditLocation;
  dynamic status;

  AuditList({
    required this.auditId,
    required this.auditNo,
    required this.auditType,
    required this.auditDesc,
    required this.auditLocation,
    required this.status,
  });

  factory AuditList.fromJson(Map<String, dynamic> json) => AuditList(
        auditId: json["auditId"] ?? 0,
        auditNo: json["auditNo"] ?? 'Aucdit no not available',
        auditType: json["auditType"] ?? 'Type not specified',
        auditDesc: json["auditDesc"] ?? 'No Description',
        auditLocation: json["auditLocation"] ?? 'Location not provided',
        status: json["status"] ?? 'Unknown Status',
      );
}
