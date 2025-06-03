
class UserTypeModel {
  final String title;
  final String image;
  final String description;
  bool isSelected;

  UserTypeModel({
    required this.title,
    required this.image,
    required this.description,
    this.isSelected = false,
  });

  factory UserTypeModel.fromJson(Map<String, dynamic> json) {
    return UserTypeModel(
      title: json['id'] as String,
      image: json['name'] as String,
      description: json['description'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'isSelected': isSelected,
    };
  }
}