class UserModel {
  final String uid;
  final String fullName;
  final String email;
  final String phone;
  final String role;
  final String profileImage;
  final bool isActive;

  // Student Information
  final String studentClass;
  final String section;
  final String rollNo;

  // Personal Information
  final String fatherName;
  final String motherName;
  final String address;
  final String gender;
  final String dob;

  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.role,
    required this.profileImage,
    required this.isActive,
    required this.studentClass,
    required this.section,
    required this.rollNo,
    required this.fatherName,
    required this.motherName,
    required this.address,
    required this.gender,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'role': role,
      'profileImage': profileImage,
      'isActive': isActive,

      'studentClass': studentClass,
      'section': section,
      'rollNo': rollNo,

      'fatherName': fatherName,
      'motherName': motherName,
      'address': address,
      'gender': gender,
      'dob': dob,

      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      role: map['role'] ?? '',
      profileImage: map['profileImage'] ?? '',
      isActive: map['isActive'] ?? true,

      studentClass: map['studentClass'] ?? '',
      section: map['section'] ?? '',
      rollNo: map['rollNo'] ?? '',

      fatherName: map['fatherName'] ?? '',
      motherName: map['motherName'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      dob: map['dob'] ?? '',

      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
}