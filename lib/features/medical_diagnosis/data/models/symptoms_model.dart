import 'package:dr_scan_graduation_project/core/utils/enums.dart';
import 'package:dr_scan_graduation_project/core/utils/extensions.dart';
import 'package:equatable/equatable.dart';

class SymptomModel extends Equatable {
  const SymptomModel({
    required this.name,
    required this.category,
    this.isSelected = false,
  });
  final String name;
  final List<BodyPart> category;
  final bool isSelected;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category.map((part) => part.toJson()).toList(),
    };
  }

  factory SymptomModel.fromJson(Map<String, dynamic> json) {
    return SymptomModel(
      name: json['name'],
      category: (json['category'] as List<dynamic>)
          .map(
            (part) => BodyPart.values.firstWhere(
              (value) => value.toJson() == part,
              orElse: () => BodyPart.other,
            ),
          )
          .toList(),
    );
  }

  SymptomModel copyWith({
    String? name,
    List<BodyPart>? category,
    bool? isSelected,
  }) {
    return SymptomModel(
      name: name ?? this.name,
      category: category ?? this.category,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [name, category, isSelected];
}

class Car {
  Car({required this.name});
  final String name;
}
