class Staff {
  String designation;
  String email;
  String password;
  String staffName;
  String staffPhoneNumber;
  bool isActive;
  bool isAdmin;

  Staff(
      {required this.designation,
      required this.email,
      required this.password,
      required this.staffName,
      required this.staffPhoneNumber,
      required this.isActive,
      required this.isAdmin});

  // Factory method to convert Firestore document snapshot to Staff object
  factory Staff.fromFirestore(Map<String, dynamic> data) {
    return Staff(
        designation: data['designation'],
        email: data['email'],
        password: data['password'],
        staffName: data['staff_name'],
        staffPhoneNumber: data['staff_phno'],
        isActive: data['isActive'],
        isAdmin: data['isAdmin']);
  }

  @override
  String toString() {
    return 'Staff{designation: $designation, email: $email, password: $password, staffName: $staffName, staffPhoneNumber: $staffPhoneNumber}';
  }
}
