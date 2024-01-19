import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> snapshot) =>
      UserModel(
        id: snapshot.id,
        name: snapshot.data()!["name"],
        email: snapshot.data()!["email"],
        phone: snapshot.data()!["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
      };
}
