import 'package:dr_scan_graduation_project/core/utils/enums.dart';

extension BodyPartExtension on BodyPart {
  String toJson() {
    return toString().split('.').last;
  }

  static BodyPart fromJson(String json) {
    return BodyPart.values.firstWhere((element) => element.toJson() == json);
  }
}
