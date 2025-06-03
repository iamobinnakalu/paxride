import 'dart:ui';
import 'package:paxride/constants/colors.dart';
import 'package:paxride/features/usertype/model/usertype_model.dart';

class UserTypeController {
  // This class can be used to manage user types in the application.
  List<UserTypeModel> userTypes = [
    UserTypeModel(
      title: 'Rider',
      description: 'book rides easily and move \ncomfortably anytime anywhere',
      image: 'assets/images/driver.png',
    ),
    UserTypeModel(
      title: 'Rental',
      description: 'Book rides easily and move \ncomfortably anytime, anywhere',
      image: 'assets/images/rental.png',
    ),
    UserTypeModel(
      title: 'Seller',
      description: 'List your car in the marketplace \nand reach more buyers.',
      image: 'assets/images/seller.png',
    ),
  ];

  // Method to toggle selection of user types
  void toggleSelection(int index) {
    for (int i = 0; i < userTypes.length; i++) {
      userTypes[i].isSelected = (i == index);
    }
  }
}