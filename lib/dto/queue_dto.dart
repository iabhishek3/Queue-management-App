import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Data data;

  Welcome({
    this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<Queue> queues;

  Data({
    this.queues,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        queues: List<Queue>.from(json["queues"].map((x) => Queue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "queues": List<dynamic>.from(queues.map((x) => x.toJson())),
      };
}

class Queue {
  String mrn;
  String patientNm;
  String roomNo;
  String sequenceNumber;
  String status;
  String tokenNo;
  String datetime;
  String typename;

  Queue({
    this.mrn,
    this.patientNm,
    this.roomNo,
    this.sequenceNumber,
    this.status,
    this.tokenNo,
    this.datetime,
    this.typename,
  });

  factory Queue.fromJson(Map<String, dynamic> json) => Queue(
        mrn: json["mrn"],
        patientNm: json["patientNm"],
        roomNo: json["roomNo"] == null ? null : json["roomNo"],
        sequenceNumber: json["sequenceNumber"],
        status: json["status"],
        tokenNo: json["tokenNo"],
        datetime: json["datetime"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "mrn": mrn,
        "patientNm": patientNm,
        "roomNo": roomNo == null ? null : roomNo,
        "sequenceNumber": sequenceNumber,
        "status": status,
        "tokenNo": tokenNo,
        "datetime": datetime,
        "__typename": typename,
      };
}
