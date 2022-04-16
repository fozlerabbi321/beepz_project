import '../../constants/images.dart';

class RpTimeLineModel {
  RpTimeLineModel({
      String? title, 
      String? desc, 
      String? image, 
      bool? isLast, 
      bool? isFast, 
      bool? isComplete,}){
    _title = title;
    _desc = desc;
    _image = image;
    _isLast = isLast;
    _isFast = isFast;
    _isComplete = isComplete;
}

  RpTimeLineModel.fromJson(dynamic json) {
    _title = json['title'];
    _desc = json['desc'];
    _image = json['image'];
    _isLast = json['isLast'];
    _isFast = json['isFast'];
    _isComplete = json['isComplete'];
  }
  String? _title;
  String? _desc;
  String? _image;
  bool? _isLast;
  bool? _isFast;
  bool? _isComplete;

  String? get title => _title;
  String? get desc => _desc;
  String? get image => _image;
  bool? get isLast => _isLast;
  bool? get isFast => _isFast;
  bool? get isComplete => _isComplete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['desc'] = _desc;
    map['image'] = _image;
    map['isLast'] = _isLast;
    map['isFast'] = _isFast;
    map['isComplete'] = _isComplete;
    return map;
  }

}
List<RpTimeLineModel> serverTimeList = [
  RpTimeLineModel(
    image: Images.menu,
    title: 'Booking Confirmed',
    desc: "you are putting that monkey in the",
    isFast: true,
  ),
  RpTimeLineModel(
    image: Images.menu,
    title: 'Driver on the way to pickup',
    desc: "you are putting that monkey in the",
  ),
  RpTimeLineModel(
    title: 'QR Code Scaned',
    image: Images.menu,
    desc: "you are putting that monkey in the",
  ),
  RpTimeLineModel(
    title: 'Car Picked Up',
    image: Images.menu,
    desc: "you are putting that monkey in the",
  ),
  RpTimeLineModel(
    title: 'Reached Garage',
    image: Images.menu,
    desc: "you are putting that monkey in the",
  ),
  RpTimeLineModel(
    title: 'Service Started',
    image: Images.menu,
    desc: "you are putting that monkey in the",
  ),
  RpTimeLineModel(
    title: 'Service Ended',
    image: Images.menu,
    desc: "you are putting that monkey in the",
  ),
  RpTimeLineModel(
    image: Images.menu,
    title: 'Driver on the way to Drop Off',
    desc: "you are putting that monkey in the",
  ),
  RpTimeLineModel(
    image: Images.menu,
    title: 'Booking Complete',
    desc: "you are putting that monkey in the",
    isLast: true,
  ),
];
