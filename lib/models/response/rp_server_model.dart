class RpServerModel {
  RpServerModel({
      int? id, 
      String? title, 
      String? subtitle, 
      String? date, 
      String? statusType, 
      int? status,}){
    _id = id;
    _title = title;
    _subtitle = subtitle;
    _date = date;
    _statusType = statusType;
    _status = status;
}

  RpServerModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _date = json['date'];
    _statusType = json['status_type'];
    _status = json['status'];
  }
  int? _id;
  String? _title;
  String? _subtitle;
  String? _date;
  String? _statusType;
  int? _status;

  int? get id => _id;
  String? get title => _title;
  String? get subtitle => _subtitle;
  String? get date => _date;
  String? get statusType => _statusType;
  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['subtitle'] = _subtitle;
    map['date'] = _date;
    map['status_type'] = _statusType;
    map['status'] = _status;
    return map;
  }
}

List<RpServerModel> serverList = [
  RpServerModel(
    id: 6746,
    title: "Service My Car",
    subtitle: "hello my car (G -1088)",
    date: "11 January, 2020",
    statusType: "Driver On The Way To Pick-Up",
    status: 1,
  ),
  RpServerModel(
    id: 74875,
    title: "Service My Car",
    subtitle: "My iOS test car (P -10088)",
    date: "08 January, 2020",
    statusType: "Driver On The Way To Pick-Up",
    status: 2,
  ),
  RpServerModel(
    id: 67585,
    title: "Service My Car",
    subtitle: "Hello my third car (M -24557)",
    date: "06 January, 2020",
    statusType: "Driver On The Way To Pick-Up",
    status: 3,
  ),
  RpServerModel(
    id: 4545,
    title: "Service My Car",
    subtitle: "hello my car (G -1088)",
    date: "05 January, 2020",
    statusType: "Driver On The Way To Pick-Up",
    status: 4,
  ),
  RpServerModel(
    id: 5445,
    title: "Service My Car",
    subtitle: "hi my forth car (R -02787)",
    date: "04 January, 2020",
    statusType: "Driver On The Way To Pick-Up",
    status: 5,
  ),
];